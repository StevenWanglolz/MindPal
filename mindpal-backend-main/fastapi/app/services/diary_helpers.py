from datetime import datetime

from models import MoodDiaryTable, UserTable
from pytz import timezone
from schemas import diary_schemas
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm import Session

from fastapi import HTTPException, status

# 設置台灣時區
tz = timezone('Asia/Taipei')

def create_diary(request: diary_schemas.CreateDiaryRequest, user_id: int, db: Session):
    new_diary = MoodDiaryTable(
        diary_mood = request.diary_mood,
        diary_event = {"events": request.diary_event},
        diary_content = request.diary_content,
        diary_create_time = datetime.now(tz),
        diary_last_change_time = datetime.now(tz),
        user_id = user_id
    )
    
    try:
        db.add(new_diary)
        db.commit()
        db.refresh(new_diary)
    except IntegrityError:
        db.rollback()    
        
def get_all_diaries_by_user_id(user_id: int, db: Session):
    user = db.query(UserTable).filter(UserTable.user_id == user_id).first()
    if not user:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="使用者不存在"
        )
    return user.mood_diary

def update_diary(request: diary_schemas.UpdateDiaryRequest, diary_emotion_rate: float, db: Session):
    diary = db.query(MoodDiaryTable).filter(MoodDiaryTable.diary_id == request.diary_id).first()
    if not diary:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="情緒日誌不存在"
        )
    diary.diary_mood = request.diary_mood
    diary.diary_event = {"events": request.diary_events}
    diary.diary_content = request.diary_content
    diary.diary_last_change_time = datetime.now(tz)
    diary.diary_emotion_rate = diary_emotion_rate
    
    db.commit()
    db.refresh(diary) 
    
def delete_diary_by_diary_id(diary_id: int, db: Session):
    diary = db.query(MoodDiaryTable).filter(MoodDiaryTable.diary_id == diary_id).first()
    if not diary:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="情緒日誌不存在"
        )
    
    db.delete(diary)
    db.commit()
