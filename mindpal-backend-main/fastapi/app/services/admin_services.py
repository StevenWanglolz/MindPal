import json
import secrets

from psycopg2 import IntegrityError
from redis import StrictRedis
from schemas import admin_schemas
from services import admin_helpers, public_helpers
from sqlalchemy.orm import Session

from fastapi import HTTPException, status


def create_admin(request: admin_schemas.CreateAdminRequest, db: Session):
    admin = admin_helpers.get_admin_by_email(request.email, db)
    if admin:
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="Email已存在")
    try:
        admin_helpers.create_admin(request, db)
        return admin_schemas.CreateAdminResponse(status=True, detail="管理員註冊成功")
    except IntegrityError:
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="Email已存在")

def admin_get_salt(admin_email: str, db: Session):
    admin = admin_helpers.get_admin_by_email(admin_email, db)
    if not admin:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="管理員帳號不存在")
    return admin_schemas.AdminGetSaltResponse(status=True, salt=admin.admin_salt.decode('utf-8'), detail="管理員取得salt成功")

def admin_login(request: admin_schemas.AdminLoginRequest, db: Session, admin_login_redis: StrictRedis):
    admin = admin_helpers.get_admin_by_email(request.email, db)
    if not admin:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="管理員帳號不存在")
    if not (request.hashed_password.encode('utf-8') == admin.admin_hashed_password):
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="密碼錯誤")
    public_helpers.delete_login_redis_by_email(request.email, admin_login_redis)
    login_detail = json.dumps({"email": admin.admin_email, "id": admin.admin_id})
    login_token = secrets.token_hex(16)
    admin_login_redis.set(login_token, login_detail, ex=86400)
    return admin_schemas.AdminLoginResponse(login_status=True, token=login_token, detail="管理員登入成功")

def update_admin(request: admin_schemas.UpdateAdminRequest, db: Session, admin_login_redis: StrictRedis):
    admin_email = admin_login_redis.get(request.token)
    if not admin_email:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入")
    admin_helpers.update_admin(request, admin_email.decode('utf-8'), db)
    
    return admin_schemas.UpdateAdminResponse(status=True, new_info={"admin_name": request.name}, detail="管理員修改個人資訊成功")