import base64
import io
import json
import os
import secrets
from tkinter import Image

from models import TherapistTable
from redis import StrictRedis
from schemas import therapist_schemas
from services import public_helpers, therapist_helpers
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm import Session

from fastapi import HTTPException, status


def create_therapist(request: therapist_schemas.CreateTherapistRequest, db: Session):
    therapist = db.query(TherapistTable).filter(TherapistTable.therapist_email == request.email).first()
    if therapist:
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="Email已經被註冊過")
    
    try:
        therapist_helpers.create_therapist(request, db)
        return therapist_schemas.CreateTherapistResponse(status=True, detail="諮商師註冊成功")
    except IntegrityError:
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="Email已經被註冊過")

def therapist_get_salt(therapist_email, db: Session):
    therapist = db.query(TherapistTable).filter(TherapistTable.therapist_email == therapist_email).first()
    if not therapist:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="此諮商師不存在")
    
    return therapist_schemas.TherapistGetSaltResponse(status=True, salt=therapist.therapist_salt.decode('utf-8'), detail="諮商師Salt取得成功")

def therapist_login(request: therapist_schemas.TherapistLoginRequest, db: Session, therapist_login_redis: StrictRedis):
    therapist = db.query(TherapistTable).filter(TherapistTable.therapist_email == request.email).first()
    if not therapist:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="此諮商師不存在")
    if not (request.hashed_password.encode('utf-8') == therapist.therapist_hashed_password):
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="密碼錯誤")
    
    public_helpers.delete_login_redis_by_email(request.email, therapist_login_redis)
    login_detail = json.dumps({"email": therapist.therapist_email, "id": therapist.therapist_id})
    login_token = secrets.token_hex(16)
    therapist_login_redis.set(login_token, login_detail, ex=86400)
    return therapist_schemas.TherapistLoginResponse(
        status=True,
        token=login_token,
        therapist_info={
            "therapist_id": therapist.therapist_id,
            "therapist_connection_amount": therapist.therapist_connection_amount,
            "therapist_certification_date": therapist.therapist_certification_date,
            "therapist_certification_img": therapist.therapist_certification_img,
            "therapist_email": therapist.therapist_email,
            "therapist_gender": therapist.therapist_gender,
            "therapist_info": therapist.therapist_info,
            "therapist_join_date": therapist.therapist_join_date,
            "therapist_name": therapist.therapist_name,
            "therapist_phone": therapist.therapist_phone,
            "therapist_specialty": therapist.therapist_specialty,
            "therapist_verified_cert": therapist.therapist_verified_cert,
            "therapist_verified_email": therapist.therapist_verified_email
        },
        detail="諮商師登入成功"
    )

def update_therapist(request: therapist_schemas.UpdateTherapistRequest, db: Session, therapist_login_redis: StrictRedis):
    therapist_email = therapist_login_redis.get(request.token)
    if not therapist_email:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")
    
    therapist_helpers.update_therapist(request, therapist_email.decode('utf-8'), db)
    
    return therapist_schemas.UpdateTherapistResponse(status=True, detail="諮商師修改個人資訊成功")

def therapist_forget_password(request: therapist_schemas.TherapistForgetPasswordRequest, db: Session, therapist_forget_password_redis: StrictRedis):
    if not therapist_helpers.get_therapist_by_email(request.email, db):
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="此諮商師不存在")
    verification_code = public_helpers.generate_verification_code()
    public_helpers.send_email(subject="重設密碼認證碼", body=f"你的驗證碼為:{verification_code}", to_email=request.email)
    forget_token = secrets.token_hex(16)
    value = json.dumps({"email": request.email, "verification_code": verification_code})
    therapist_forget_password_redis.set(forget_token, value)
    
    return therapist_schemas.TherapistForgetPasswordResponse(status=True, token=forget_token, detail="寄送驗證碼成功")    

def therapist_verify_code(request: therapist_schemas.TherapistVerifyCodeRequest, therapist_forget_password_redis: StrictRedis, therapist_reset_password_redis: StrictRedis):
    therapist = therapist_forget_password_redis.get(request.token)
    if not therapist:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="進程錯誤")
    
    json_therapist = json.loads(therapist)
    if not json_therapist["verification_code"] == request.verification_code:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="驗證碼認證錯誤")
    else:
        reset_token = secrets.token_hex(16)
        therapist_forget_password_redis.delete(request.token)
        therapist_reset_password_redis.set(reset_token, json_therapist["email"])
        return therapist_schemas.TherapistVerifyCodeResponse(status=True, token=reset_token, detail="驗證碼認證成功")

def therapist_resend_verification_code(request: therapist_schemas.TherapistResendVerificationCodeRequest, therapist_forget_password_redis: StrictRedis):
    therapist = therapist_forget_password_redis.get(request.token)
    if not therapist:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="進程錯誤")
    
    json_therapist = json.loads(therapist)
    verification_code = public_helpers.generate_verification_code()
    json_therapist["verification_code"] = verification_code
    public_helpers.send_email(subject="重設密碼認證碼", body=f"你的驗證碼為:{verification_code}", to_email=json_therapist["email"])
    therapist_forget_password_redis.set(request.token, json.dumps(json_therapist))
    
    return therapist_schemas.TherapistResendVerificationCodeResponse(status=True, detail="重新寄送驗證碼成功")
    
def therapist_reset_password(request: therapist_schemas.TherapistResetPasswordRequest, db: Session, therapist_reset_password_redis: StrictRedis):
    therapist = therapist_reset_password_redis.get(request.token)
    if not therapist:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="進程錯誤")
    
    therapist_helpers.update_therapist_password_and_salt(request, therapist.decode('utf-8'), db)
    therapist_reset_password_redis.delete(request.token)
    public_helpers.send_email(subject="重設密碼通知", body=f"你在MindPal進行重設密碼成功。", to_email=therapist.decode('utf-8'))
    
    return therapist_schemas.TherapistResetPasswordResponse(status=True, detail="Therapist Reset Password and Salt Success.")

def admin_read_therapists(login_token, db: Session, admin_login_redis: StrictRedis):
    if not admin_login_redis.get(login_token):
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")
    
    therapists = therapist_helpers.admin_get_all_therapists(db=db)
    
    return therapists

def user_read_therapists(login_token: str, db: Session, user_login_redis: StrictRedis):
    if not user_login_redis.get(login_token):
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")
    
    therapists = therapist_helpers.user_get_all_therapists(db=db)
    
    return therapists

def delete_therapist(therapist_id: int, login_token: str, db: Session, admin_login_redis: StrictRedis):
    if not admin_login_redis.get(login_token):
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")
            
    therapist_helpers.delete_therapist_by_id(therapist_id, db)
    
    return therapist_schemas.DeleteTherapistResponse(status=True, detail="諮商師刪除成功")

def therapist_send_verification_code(therapist_email: str, db: Session, therapist_forget_password_redis: StrictRedis):
    therapist = therapist_helpers.get_therapist_by_email(therapist_email, db)
    if not therapist:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="此諮商師不存在")
    verification_code = public_helpers.generate_verification_code()
    token = secrets.token_hex(16)
    detail = json.dumps({"email": therapist_email, "verification_code": verification_code})
    therapist_forget_password_redis.set(token, detail)
    public_helpers.send_email(subject="認證信箱驗證碼", body=f"你的驗證碼為:{verification_code}", to_email=therapist_email)
    return therapist_schemas.TherapistSendVerificationCodeResponse(status=True, token=token, detail="發送驗證碼成功")

def therapist_verify_code(request: therapist_schemas.TherapistVerifyRequest, db: Session, therapist_forget_password_redis: StrictRedis):
    process_therapist = therapist_forget_password_redis.get(request.token)
    if not process_therapist:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="進程錯誤")
    json_therapist = json.loads(process_therapist)
    if json_therapist["verification_code"] != request.verification_code:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="驗證碼認證錯誤")
    therapist_helpers.update_therapist_verified(therapist_email=json_therapist["email"], db=db)
    public_helpers.send_email(subject="諮商師信箱認證成功", body=f"您的MindPal帳號已經成功啟用", to_email=json_therapist["email"])
    therapist_forget_password_redis.delete(request.token)
    return therapist_schemas.TherapistVerifyResponse(status=True, detail="驗證成功")

def admin_update_therapist_cert_verified(request: therapist_schemas.AdminUpdateTherapistCertVerifiedRequest, db: Session, admin_login_redis: StrictRedis):
    if not admin_login_redis.get(request.login_token):
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")
    
    therapist_helpers.admin_update_therapist_cert_verified(request.therapist_email, request.verified, db)
    
    public_helpers.send_email(subject="諮商師證照認證狀態更新通知", body=f"你在MindPal的諮商師證照認證已通過。", to_email=request.therapist_email)
    
    return therapist_schemas.AdminUpdateTherapistCertVerifiedResponse(status=True, detail="管理員更新諮商師證照認證狀態成功")

#諮商師上傳證照照片
#諮商師從網頁端上傳證照照片，將證照照片儲存至server的本地資料夾，並將證照照片路徑儲存至資料庫
def upload_therapist_cert(
    request: therapist_schemas.TherapistUploadCertPhotoRequest, 
    db: Session, 
    therapist_login_redis: StrictRedis
):
    login_therapist = therapist_login_redis.get(request.login_token)
    if not login_therapist:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")
    
    json_login_therapist = json.loads(login_therapist)
    
    # 解碼 base64 圖片
    cert_photo = base64.b64decode(request.cert_photo)
    
    # 保存文件
    media_dir = "/app/media"
    os.makedirs(media_dir, exist_ok=True)
    sanitized_email = json_login_therapist['email'].replace('@', '_at_').replace('.', '_dot_')
    image_path = os.path.join(media_dir, f"{sanitized_email}.jpg")

    with open(image_path, "wb") as f:
        f.write(cert_photo)

    therapist_helpers.update_therapist_cert(json_login_therapist["email"], image_path, db)
    
    return therapist_schemas.TherapistUploadCertPhotoResponse(status=True, detail="諮商師上傳證照照片成功")