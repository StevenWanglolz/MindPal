from datetime import datetime

from models import TherapistTable
from psycopg2 import IntegrityError
from pytz import timezone
from redis import StrictRedis
from schemas import therapist_schemas
from sqlalchemy.orm import Session

from fastapi import HTTPException, status

# 設置台灣時區
tz = timezone('Asia/Taipei')

def get_therapist_id_by_token(token: str, db: Session, therapist_login_redis: StrictRedis) -> int:
    # 從 Redis 中取得 user_email
    therapist_email = therapist_login_redis.get(token)
    
    # 檢查 Redis 中是否存在該 token 對應的 email
    if not therapist_email:
        return None
    
    # 使用 user_email 從資料庫中查找對應的 user
    therapist = db.query(TherapistTable).filter(TherapistTable.user_email == therapist_email).first()
    
    # 檢查是否找到對應的 user
    if not therapist:
        return None
    
    # 返回 user_id
    return therapist.therapist_id

def get_therapist_by_email(email: str, db: Session):
    therapist = db.query(TherapistTable).filter(TherapistTable.therapist_email == email).first()
    if not therapist: return None
    return therapist

def create_therapist(request: therapist_schemas.CreateTherapistRequest, db: Session):
    new_therapist = TherapistTable(
        therapist_connection_amount = 0,
        therapist_email = request.email,
        therapist_gender = request.gender,
        therapist_hashed_password = request.hashed_password.encode('utf-8'),
        therapist_info = request.info,
        therapist_join_date = datetime.now(tz),
        therapist_name = request.name,
        therapist_phone = request.phone,
        therapist_salt = request.salt.encode('utf-8'),
        therapist_specialty = {"specialty":request.specialty},
        therapist_verified_cert = False,
        therapist_verified_email = False
    )
    
    # 添加到資料庫並提交
    try:
        db.add(new_therapist)
        db.commit()
        db.refresh(new_therapist)
    except IntegrityError:
        db.rollback()   

def admin_get_all_therapists(db: Session) -> dict:
    # 查詢所有用戶
    therapists = db.query(TherapistTable).all()
    
    # 將用戶資料轉換為字典
    therapists_list = []
    for therapist in therapists:
        therapist_dict = {
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
        }
        therapists_list.append(therapist_dict)
    
    # 返回結果
    return {"therapists": therapists_list}

def user_get_all_therapists(db: Session) -> dict:
    # 查詢所有用戶
    therapists = db.query(TherapistTable).all()
    
    # 將用戶資料轉換為字典
    therapists_list = []
    for therapist in therapists:
        therapist_dict = {
            "therapist_id": therapist.therapist_id,
            "therapist_email": therapist.therapist_email,
            "therapist_gender": therapist.therapist_gender,
            "therapist_info": therapist.therapist_info,
            "therapist_join_date": therapist.therapist_join_date,
            "therapist_name": therapist.therapist_name,
            "therapist_phone": therapist.therapist_phone,
            "therapist_specialty": therapist.therapist_specialty,
            "therapist_connection_amount": therapist.therapist_connection_amount,
            "therapist_verified_email": therapist.therapist_verified_email,
            "therapist_verified_cert": therapist.therapist_verified_cert,            
        }
        therapists_list.append(therapist_dict)
    
    # 返回結果
    return {"therapists": therapists_list}

def update_therapist(request: therapist_schemas.UpdateTherapistRequest, therapist_email: str, db: Session):
    therapist = db.query(TherapistTable).filter(TherapistTable.therapist_email == therapist_email).first()
    
    therapist.therapist_gender = request.gender
    therapist.therapist_info = request.info
    therapist.therapist_name = request.name
    therapist.therapist_phone = request.phone
    therapist.therapist_specialty = {"specialty":request.specialty}
    
    db.commit()
    db.refresh(therapist)
    
def update_therapist_password_and_salt(request: therapist_schemas.TherapistResetPasswordRequest, therapist_email:str, db: Session):
    therapist = db.query(TherapistTable).filter(TherapistTable.therapist_email == therapist_email).first()
    
    therapist.therapist_salt = request.new_salt.encode('utf-8')
    therapist.therapist_hashed_password = request.new_hashed_password.encode('utf-8')
    
    db.commit()
    db.refresh(therapist)
    
def delete_therapist_by_id(therapist_id, db: Session):
    therapist = db.query(TherapistTable).filter(TherapistTable.therapist_id == therapist_id).first()
    if not therapist:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="諮商師不存在")
    db.delete(therapist)
    db.commit()
    
def update_therapist_verified(therapist_email: str, db: Session):
    therapist = db.query(TherapistTable).filter(TherapistTable.therapist_email == therapist_email).first()
    if not therapist:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="諮商師不存在")
    therapist.therapist_verified_email = True
    db.commit()
    db.refresh(therapist)
    
def admin_update_therapist_cert_verified(therapist_email: str, verified: bool, db: Session):
    therapist = db.query(TherapistTable).filter(TherapistTable.therapist_email == therapist_email).first()
    if not therapist:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="諮商師不存在")
    therapist.therapist_verified_cert = verified
    db.commit()
    db.refresh(therapist)
    
def update_therapist_cert(therapist_email: str, image_path: str, db: Session):
    therapist = db.query(TherapistTable).filter(TherapistTable.therapist_email == therapist_email).first()
    if not therapist:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="諮商師不存在")
    therapist.therapist_certification_img = image_path
    db.commit()
    db.refresh(therapist)