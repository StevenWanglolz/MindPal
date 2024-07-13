from datetime import datetime

from models import AdminTable
from pytz import timezone
from redis import StrictRedis
from schemas import admin_schemas
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm import Session

# 設置台灣時區
tz = timezone('Asia/Taipei')

def get_admin_by_email(email: str, db: Session):
    admin = db.query(AdminTable).filter(AdminTable.admin_email == email).first()
    if not admin: return None
    return admin

def create_admin(request: admin_schemas.CreateAdminRequest, db: Session):
    new_admin = AdminTable(
        admin_name = request.name,
        admin_email = request.email,
        admin_salt = request.salt.encode('utf-8'),
        admin_hashed_password = request.hashed_password.encode('utf-8')   
    )
    
    try:
        db.add(new_admin)
        db.commit()
        db.refresh(new_admin)
    except IntegrityError:
        db.rollback()
        
def update_admin(request: admin_schemas.UpdateAdminRequest, admin_email: str, db: Session):
    admin = db.query(AdminTable).filter(AdminTable.admin_email == admin_email).first()
    admin.admin_name = request.name
    db.commit()
    db.refresh(admin)        