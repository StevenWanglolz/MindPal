import json
import secrets
from smtplib import SMTP

from langchain_openai import ChatOpenAI
from mindpal_llm import ai_consult
from redis import StrictRedis
from schemas import diary_schemas
from services import diary_helpers, user_helpers
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm import Session

from fastapi import HTTPException, status


def create_diary(request: diary_schemas.CreateDiaryRequest, db: Session, chat_model: ChatOpenAI, user_login_redis: StrictRedis):
    login_user = user_login_redis.get(request.token)
    if not login_user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")
    json_login_user = json.loads(login_user)
    try:
        diary_helpers.create_diary(request=request, user_id=json_login_user["id"], db=db)
        diary_emotion_rate = ai_consult.generate_chat_diary_rate(diary_content=request.diary_content, chat_model=chat_model)
        user_helpers.update_user_emotion_rate(user_id=json_login_user["id"], emotion_rate=diary_emotion_rate, db=db)        
        return diary_schemas.CreateDiaryResponse(status=True, detail="新增情緒日誌成功")
    except IntegrityError:
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="新增情緒日誌失敗")  
    
def read_diaries(login_token: str, db: Session, user_login_redis: StrictRedis):
    login_user = user_login_redis.get(login_token)
    if not login_user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")
    json_login_user = json.loads(login_user)
    diaries = diary_helpers.get_all_diaries_by_user_id(user_id=json_login_user["id"], db=db)
    return diaries
    

def update_diary(request: diary_schemas.UpdateDiaryRequest, db: Session, chat_model: ChatOpenAI, user_login_redis: StrictRedis):
    login_user = user_login_redis.get(request.token)
    if not login_user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")
    json_login_user = json.loads(login_user)
    diary_emotion_rate = ai_consult.generate_chat_diary_rate(diary_content=request.diary_content, chat_model=chat_model)
    diary_helpers.update_diary(request=request, diary_emotion_rate=diary_emotion_rate, db=db)
    user_helpers.update_user_emotion_rate(user_id=json_login_user["id"], emotion_rate=diary_emotion_rate, db=db)       
    return diary_schemas.UpdateDiaryResponse(status=True, detail="使用者修改情緒日誌成功")

def delete_diary(diary_id: int, login_token: str, db: Session, user_login_redis: StrictRedis):
    login_user = user_login_redis.get(login_token)
    if not login_user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="請重新登入.")
    diary_helpers.delete_diary_by_diary_id(diary_id=diary_id, db=db)
    return diary_schemas.DeleteDiaryResponse(status=True, detail="使用者刪除情緒日誌成功")