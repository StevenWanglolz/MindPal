import json
import secrets

from redis import StrictRedis
from schemas import user_schemas
from services import public_helpers, user_helpers
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm import Session

from fastapi import HTTPException, status


def create_user(request: user_schemas.CreateUserRequest, db: Session):
    user = user_helpers.get_user_by_email(request.email, db)
    if user:
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="該Email已經被註冊過了")
    
    try:
        user_helpers.create_user(request, db)
        return user_schemas.CreateUserResponse(status=True, detail="會員註冊成功")
    except IntegrityError:
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="會員註冊失敗")
    except Exception:
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail="伺服器錯誤")

def user_get_salt(user_email: str, db: Session):
    user = user_helpers.get_user_by_email(user_email, db)
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="此會員並不存在")

    return user_schemas.UserGetSaltResponse(status=True, salt=user.user_salt.decode('utf-8'), detail="會員取得salt成功")

def user_login(request: user_schemas.UserLoginRequest, db: Session, user_login_redis: StrictRedis):
    user = user_helpers.get_user_by_email(request.email, db)
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="此會員並不存在")
    
    if not (request.hashed_password.encode('utf-8') == user.user_hashed_password):
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="密碼錯誤")
    
    public_helpers.delete_login_redis_by_email(request.email, user_login_redis)
    login_detail = json.dumps({"email": user.user_email, "id": user.user_id})
    login_token = secrets.token_hex(16)
    user_login_redis.set(login_token, login_detail, ex=86400)
    return user_schemas.UserLoginResponse(
        status=True,
        token=login_token,
        user_info={
            "user_id": user.user_id,
            "user_email": user.user_email,
            "user_emergency_contact": user.user_emergency_contact,
            "user_emergency_contact_phone": user.user_emergency_contact_phone,
            "user_emergency_contact_email": user.user_emergency_contact_email,
            "user_gender": user.user_gender,
            "user_join_date": user.user_join_date,
            "user_name": user.user_name,
            "user_phone": user.user_phone,
            "user_verified": user.user_verified,
            "user_emotion_rate": user.user_emotion_rate
        },
        detail="會員登入成功"
    )

def update_user(request: user_schemas.UpdateUserRequest, db: Session, user_login_redis: StrictRedis):
    login_user = user_login_redis.get(request.token)
    if not login_user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")
    json_login_user = json.loads(login_user)
    user_helpers.update_user(request, json_login_user["email"], db)
    
    return user_schemas.UpdateUserResponse(status=True, detail="會員修改個人資訊成功")
    
def user_forget_send_verification_code(request: user_schemas.UserForgetPasswordRequest, db: Session, user_forget_password_redis: StrictRedis):
    if not user_helpers.get_user_by_email(request.email, db):
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="此Email並不存在")
    verification_code = public_helpers.generate_verification_code()
    public_helpers.send_email(subject="重設密碼認證碼", body=f"你的驗證碼為:{verification_code}", to_email=request.email)
    forget_token = secrets.token_hex(16)
    value = json.dumps({"email": request.email, "verification_code": verification_code})
    user_forget_password_redis.set(forget_token, value)
    
    return user_schemas.UserForgetPasswordResponse(status=True, token=forget_token, detail="寄送驗證碼至信箱成功")    

def user_forget_verify_code(request: user_schemas.UserVerifyCodeRequest, user_forget_password_redis: StrictRedis, user_reset_password_redis: StrictRedis):
    user = user_forget_password_redis.get(request.token)
    if not user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="進程錯誤")
    json_user = json.loads(user)
    if not json_user["verification_code"] == request.verification_code:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="驗證碼認證錯誤")
    else:
        reset_token = secrets.token_hex(16)
        user_forget_password_redis.delete(request.token)
        user_reset_password_redis.set(reset_token, json_user["email"])
        return user_schemas.UserVerifyCodeResponse(status=True, token=reset_token, detail="驗證碼認證成功")

def user_forget_resend_verification_code(request: user_schemas.UserResendVerificationCodeRequest, user_forget_password_redis: StrictRedis):
    user = user_forget_password_redis.get(request.token)
    if not user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="進程錯誤")
    json_user = json.loads(user)
    verification_code = public_helpers.generate_verification_code()
    json_user["verification_code"] = verification_code
    public_helpers.send_email(subject="重設密碼認證碼", body=f"你的驗證碼為:{verification_code}", to_email=json_user["email"])
    user_forget_password_redis.set(request.token, json.dumps(json_user))
    return user_schemas.UserResendVerificationCodeResponse(status=True, detail="發送驗證碼成功")
    
def user_forget_reset_password(request: user_schemas.UserResetPasswordRequest, db: Session, user_reset_password_redis: StrictRedis):
    user = user_reset_password_redis.get(request.token)
    if not user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="進程錯誤")
    user_helpers.update_user_password_and_salt(request, user.decode('utf-8'), db)
    user_reset_password_redis.delete(request.token)
    public_helpers.send_email(subject="重設密碼通知", body=f"你在MindPal進行重設密碼成功。", to_email=user.decode('utf-8'))
    return user_schemas.UserResetPasswordResponse(status=True, detail="重設密碼成功")
    
def read_users(login_token: str, db: Session, admin_login_redis: StrictRedis):
    if not admin_login_redis.get(login_token):
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")
    
    users = user_helpers.get_all_users(db=db)
    
    return users

def delete_user(user_id: int, login_token: str, db: Session, admin_login_redis: StrictRedis):
    if not admin_login_redis.get(login_token):
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")
            
    user_helpers.delete_user_by_id(user_id, db)
    
    return user_schemas.DeleteUserResponse(status=True, detail="會員刪除成功")

def user_send_verification_code(user_email: str, db: Session, user_forget_password_redis: StrictRedis):
    user = user_helpers.get_user_by_email(user_email, db)
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="此會員並不存在")
    verification_code = public_helpers.generate_verification_code()
    token = secrets.token_hex(16)
    detail = json.dumps({"email": user_email, "verification_code": verification_code})
    user_forget_password_redis.set(token, detail)
    public_helpers.send_email(subject="認證信箱驗證碼", body=f"你的驗證碼為:{verification_code}", to_email=user_email)
    return user_schemas.UserSendVerificationCodeResponse(status=True, token=token, detail="發送驗證碼成功")

def user_verify_code(request: user_schemas.UserVerifyRequest, db: Session, user_forget_password_redis: StrictRedis):
    process_user = user_forget_password_redis.get(request.token)
    if not process_user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="進程錯誤")
    json_user = json.loads(process_user)
    if json_user["verification_code"] != request.verification_code:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="驗證碼認證錯誤")
    user_helpers.update_user_verified(user_email=json_user["email"], db=db)
    public_helpers.send_email(subject="信箱認證成功", body=f"您的MindPal帳號已經成功啟用", to_email=json_user["email"])
    user_forget_password_redis.delete(request.token)
    return user_schemas.UserVerifyResponse(status=True, detail="會員驗證碼認證成功")

def user_get_info(login_token: str, db: Session, user_login_redis: StrictRedis):
    login_user = user_login_redis.get(login_token)
    if not login_user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入")
    json_login_user = json.loads(login_user)
    user = user_helpers.get_user_by_email(email=json_login_user["email"], db=db)
    
    return user_schemas.ReadUserResponse(
        status=True,
        user_info={
            "user_id": user.user_id,
            "user_email": user.user_email,
            "user_emergency_contact": user.user_emergency_contact,
            "user_emergency_contact_phone": user.user_emergency_contact_phone,
            "user_emergency_contact_email": user.user_emergency_contact_email,
            "user_gender": user.user_gender,
            "user_join_date": user.user_join_date,
            "user_name": user.user_name,
            "user_phone": user.user_phone,
            "user_verified": user.user_verified,
            "user_emotion_rate": user.user_emotion_rate
        },
        detail="會員資料讀取成功")