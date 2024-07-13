import json

from redis import StrictRedis
from schemas import connection_schemas
from services import connection_helpers
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm import Session

from fastapi import HTTPException, status


# 添加連接請求
def create_connection(request: connection_schemas.CreateConnectionRequest, db: Session, user_login_redis: StrictRedis):
    login_user = user_login_redis.get(request.token)
    if not login_user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")
    json_login_user = json.loads(login_user)
    if connection_helpers.check_active_connection(user_id=json_login_user["id"], db=db):
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="會員存在進行中的連結")
    try:
        connection_helpers.create_connection(user_id=json_login_user["id"], therapist_id=request.therapist_id, db=db)
        return connection_schemas.CreateConnectionResponse(status=True, detail="會員建立連結請求成功")
    except IntegrityError:
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="會員建立連結請求失敗")
    
def therapist_read_connections(login_token: str, db: Session, therapist_login_redis: StrictRedis):
    login_therapist = therapist_login_redis.get(login_token)
    if not login_therapist:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")
    json_login_therapist = json.loads(login_therapist)
    return connection_helpers.get_all_therapist_connections(therapist_id=json_login_therapist["id"], db=db)

def user_read_connection(login_token: str, db: Session, user_login_redis: StrictRedis):
    login_user = user_login_redis.get(login_token)
    if not login_user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")     
    json_login_user = json.loads(login_user)
    return connection_helpers.get_user_connection(user_id=json_login_user["id"], db=db)
    
def therapist_update_connection(request: connection_schemas.TherapistUpdateConnectionRequest, db: Session, therapist_login_redis: StrictRedis):
    login_therapist = therapist_login_redis.get(request.login_token)
    if not login_therapist:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")   
    json_login_therapist = json.loads(login_therapist)
    connection_helpers.therapist_update_connection(user_id=request.user_id, therapist_id=json_login_therapist["id"], connection_status=request.connection_status, db=db)
    return connection_schemas.TherapistUpdateConnectionResponse(status=True, detail="諮商師更新連結狀態成功")
 
def therapist_disconnect_connection(request: connection_schemas.TherapistDisconnectRequest, db: Session, therapist_login_redis: StrictRedis):
    login_therapist = therapist_login_redis.get(request.login_token)
    if not login_therapist:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.") 
    json_login_therapist = json.loads(login_therapist)
    connection_helpers.disconnect_connection(user_id=request.user_id, therapist_id=json_login_therapist["id"], db=db)
    return connection_schemas.TherapistDisconnectResponse(status=True, detail="諮商師取消連結成功")

def admin_disconnect_connection(request: connection_schemas.AdminDisconnetionRequest, db: Session, admin_login_redis: StrictRedis):
    login_admin = admin_login_redis.get(request.login_token)
    if not login_admin:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.") 
    connection_helpers.disconnect_connection(user_id=request.user_id, therapist_id=request.therapist_id, db=db)
    return connection_schemas.AdminDisconnetionResponse(status=True, detail="管理員取消連結成功")
        