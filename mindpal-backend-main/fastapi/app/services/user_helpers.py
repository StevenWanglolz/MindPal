import json
from datetime import datetime

from models import UserTable
from pytz import timezone
from redis import StrictRedis
from schemas import user_schemas
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm import Session

from fastapi import HTTPException, status

# 設置台灣時區
tz = timezone('Asia/Taipei')

def get_user_by_token(token: str, db: Session, user_login_redis: StrictRedis):
    # 從 Redis 中取得 user_email
    user_email = user_login_redis.get(token)
    
    # 檢查 Redis 中是否存在該 token 對應的 email
    if not user_email:
        return None
    
    # 使用 user_email 從資料庫中查找對應的 user
    user = db.query(UserTable).filter(UserTable.user_email == user_email.decode('utf-8')).first()
    
    # 檢查是否找到對應的 user
    if not user:
        return None
    
    # 返回 user_id
    return user

def get_user_by_email(email: str, db: Session):
    user = db.query(UserTable).filter(UserTable.user_email == email).first()
    if not user: return None
    return user
                
def create_user(request: user_schemas.CreateUserRequest, db: Session):
    new_user = UserTable(
        user_email=request.email,
        user_emergency_contact=request.emergency_contact,
        user_emergency_contact_email=request.emergency_contact_email,
        user_emergency_contact_phone=request.emergency_contact_phone,
        user_gender=int(request.gender),
        user_hashed_password=request.hashed_password.encode("utf-8"),
        user_join_date=datetime.now(tz),
        user_name=request.name,
        user_phone=request.phone,
        user_salt=request.salt.encode("utf-8"),
        user_verified=False,
        user_emotion_rate=-1
    )
    
    try:
        db.add(new_user)
        db.commit()
        db.refresh(new_user)
    except IntegrityError:
        db.rollback()
    
def update_user(request: user_schemas.UpdateUserRequest, user_email: str, db: Session):
    user = db.query(UserTable).filter(UserTable.user_email == user_email).first()
    
    user.user_emergency_contact = request.emergency_contact
    user.user_emergency_contact_email = request.emergency_contact_email
    user.user_emergency_contact_phone = request.emergency_contact_phone
    user.user_gender = request.gender
    user.user_name = request.name
    user.user_phone = request.phone
    
    db.commit()
    db.refresh(user)    
    
def update_user_password_and_salt(request: user_schemas.UserResetPasswordRequest, user_email:str, db: Session):
    user = db.query(UserTable).filter(UserTable.user_email == user_email).first()
    
    user.user_salt = request.new_salt.encode('utf-8')
    user.user_hashed_password = request.new_hashed_password.encode('utf-8')
    
    db.commit()
    db.refresh(user)
    
    
def get_all_users(db: Session) -> list:
    # 查詢所有用戶
    users = db.query(UserTable).all()
    
    # 將用戶資料轉換為字典
    users_list = []
    for user in users:
        user_dict = {
            "user_id": user.user_id,
            "user_email": user.user_email,
            "user_emergency_contact": user.user_emergency_contact,
            "user_emergency_contact_phone": user.user_emergency_contact_phone,
            "user_emergency_contact_email": user.user_emergency_contact_email,
            "user_gender": user.user_gender,
            "user_join_date": user.user_join_date,
            "user_name": user.user_name,
            "user_phone": user.user_phone,
            "user_verified": user.user_verified
        }
        users_list.append(user_dict)
    
    # 返回結果
    return users_list

def delete_user_by_id(user_id, db: Session):
    user = db.query(UserTable).filter(UserTable.user_id == user_id).first()
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="使用者不存在")
    db.delete(user)
    db.commit()
    
def update_user_verified(user_email: str, db: Session):
    user = db.query(UserTable).filter(UserTable.user_email == user_email).first()
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="此會員並不存在")
    user.user_verified = True
    db.commit()
    db.refresh(user)
    
def update_user_emotion_rate(user_id: str, emotion_rate: float, db: Session):
    user = db.query(UserTable).filter(UserTable.user_id == user_id).first()
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="此會員並不存在")
    print("更改前情緒分數: ", user.user_emotion_rate)
    if user.user_emotion_rate == -1:
        user.user_emotion_rate = 0.5 + emotion_rate
    else:
        user.user_emotion_rate = user.user_emotion_rate + emotion_rate
    print("更改後情緒分數: ", user.user_emotion_rate)
    db.commit()
    db.refresh(user)
    
