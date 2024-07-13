from datetime import datetime

from models import ConnectionTable, TherapistTable, UserTable
from pytz import timezone
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm import Session

from fastapi import HTTPException, status

# 設置台灣時區
tz = timezone('Asia/Taipei')
# 添加連接請求
def create_connection(user_id: int, therapist_id: int, db: Session):
    new_connection = ConnectionTable(
        user_id=user_id,
        therapist_id=therapist_id,
        connection_status=0,  # 假設 0 表示請求發出
        connection_send_time = datetime.now(tz)
    )
    try:
        db.add(new_connection)
        db.commit()
        db.refresh(new_connection)
    except IntegrityError:
        db.rollback()

def check_active_connection(user_id: int, db: Session):
    # 查找是否存在 connection_status 為 0 或 2 的連接
    connection = db.query(ConnectionTable).filter(
        ConnectionTable.user_id == user_id,
        ConnectionTable.connection_status.in_([0, 2])
    ).first()
    
    if connection:
        return True
    else:
        return False

# 獲取某個用戶的目前的連接請求
def get_user_connection(user_id: int, db: Session):
    connection_0 = db.query(ConnectionTable).filter(ConnectionTable.user_id == user_id, ConnectionTable.connection_status == 0).first()
    if connection_0: return connection_0
    connection_2 = db.query(ConnectionTable).filter(ConnectionTable.user_id == user_id, ConnectionTable.connection_status == 2).first()
    if connection_2: return connection_2
    
    raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="目前沒有待回覆或是已接受的連結")
    

# 獲取某個諮商師的所有連接請求
def get_all_therapist_connections(therapist_id: int, db: Session):
    therapist = db.query(TherapistTable).filter(TherapistTable.therapist_id == therapist_id).first()
    if not therapist:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="諮商師不存在")
    return therapist.connections

def therapist_update_connection(user_id: int, therapist_id: int, connection_status: int, db: Session):
    connection = db.query(ConnectionTable).filter(ConnectionTable.user_id == user_id, ConnectionTable.therapist_id == therapist_id, ConnectionTable.connection_status == 0).first()
    if not connection:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="該諮商師和該會員不存在待回覆的連結請求")
    connection.connection_status = connection_status
    connection.connection_response_time = datetime.now(tz)
    db.commit()
    db.refresh(connection)
    
def disconnect_connection(user_id: int, therapist_id: int, db: Session):
    connection = db.query(ConnectionTable).filter(ConnectionTable.user_id == user_id, ConnectionTable.therapist_id == therapist_id, ConnectionTable.connection_status == 2).first()
    if not connection:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="該諮商師和該會員不存在進行中的連結請求")
    connection.connection_status = 3
    connection.connection_disconnect_time = datetime.now(tz)
    db.commit()
    db.refresh(connection)        
    