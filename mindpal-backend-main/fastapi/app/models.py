from sqlalchemy import (CHAR, FLOAT, JSON, VARCHAR, Boolean, Column, DateTime,
                        ForeignKey, Integer, LargeBinary, SmallInteger, String)
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship

Base = declarative_base()

class UserTable(Base):
    __tablename__ = "tbl_user"

    user_id = Column(Integer, primary_key=True, index=True, nullable=False)
    user_email = Column(VARCHAR(50), unique=True, nullable=False)
    user_emergency_contact = Column(VARCHAR(20), nullable=False)
    user_emergency_contact_phone = Column(CHAR(10), nullable=False)
    user_emergency_contact_email = Column(VARCHAR(50), nullable=False)
    user_gender = Column(SmallInteger, nullable=False) # 0: male, 1: female, 2: other
    user_hashed_password = Column(LargeBinary, nullable=False)
    user_join_date = Column(DateTime(timezone=True), nullable=False)
    user_name = Column(VARCHAR(20), nullable=False)
    user_phone = Column(CHAR(10), nullable=False)
    user_salt = Column(LargeBinary, nullable= False)
    user_verified = Column(Boolean, nullable=False)
    user_emotion_rate = Column(FLOAT, default=-1,nullable=False)
    
    # Relationships
    connection = relationship("ConnectionTable", back_populates="user")
    mood_diary = relationship("MoodDiaryTable", back_populates="user")
    chat = relationship("ChatTable", back_populates="user")
    test = relationship("TestTable", back_populates="user")


class TherapistTable(Base):
    
    __tablename__ = "tbl_therapist"
    therapist_id = Column(Integer, primary_key=True, index=True, nullable=False)
    therapist_connection_amount = Column(SmallInteger, nullable=False)
    therapist_certification_date = Column(DateTime(timezone=True))
    therapist_certification_img = Column(VARCHAR(255))
    therapist_email = Column(String, unique=True, nullable=False)
    therapist_gender = Column(SmallInteger, nullable=False)
    therapist_hashed_password = Column(LargeBinary, nullable=False)
    therapist_info = Column(VARCHAR(255))
    therapist_join_date = Column(DateTime(timezone=True), nullable=False)
    therapist_name = Column(VARCHAR(20), nullable=False)
    therapist_phone = Column(CHAR(10), nullable=False)
    therapist_salt = Column(LargeBinary, nullable=False)
    therapist_specialty = Column(JSON)
    therapist_verified_cert = Column(Boolean, nullable=False)
    therapist_verified_email = Column(Boolean, nullable=False)
    
    # Relationships
    connection = relationship("ConnectionTable", back_populates="therapist")
    
class AdminTable(Base):
    __tablename__ = "tbl_admin"
    
    admin_id = Column(Integer, primary_key=True, index=True, nullable=False)
    admin_name = Column(VARCHAR(20), nullable=False)
    admin_email = Column(VARCHAR(255), nullable=False)
    admin_salt = Column(LargeBinary, nullable=False)
    admin_hashed_password = Column(LargeBinary, nullable=False)

class ConnectionTable(Base):
    __tablename__ = "tbl_connection_request"
    
    connection_id = Column(Integer, primary_key=True, index=True, nullable=False)
    connection_status = Column(SmallInteger, nullable=False) # 0:發送尚未回應, 1:發送且被拒絕, 2:發送且被接受, 3:斷開連結
    connection_send_time = Column(DateTime(timezone=True), nullable=False)
    connection_response_time = Column(DateTime(timezone=True))
    connection_disconnect_time = Column(DateTime(timezone=True))
    connection_note = Column(VARCHAR(1000 ))
    
    # Foreign keys
    user_id = Column(Integer, ForeignKey('tbl_user.user_id'), nullable=False)
    therapist_id = Column(Integer, ForeignKey('tbl_therapist.therapist_id'), nullable=False)
    
    # Relationships
    user = relationship("UserTable", back_populates="connection")
    therapist = relationship("TherapistTable", back_populates="connection")

class MoodDiaryTable(Base):
    __tablename__ = "tbl_mood_diary"
    
    diary_id = Column(Integer, primary_key=True, index=True, nullable=False)
    diary_mood = Column(SmallInteger, nullable=False)
    diary_event = Column(JSON, default={"events":[]}, nullable=False)
    diary_content = Column(VARCHAR(255))
    diary_create_time = Column(DateTime(timezone=True))
    diary_last_change_time = Column(DateTime(timezone=True))
    diary_emotion_rate = Column(FLOAT, default=-1, nullable=False)
    
    # Foreign Keys
    user_id = Column(Integer, ForeignKey('tbl_user.user_id'), nullable=False)
    
    # Relationships
    user = relationship("UserTable", back_populates="mood_diary")

class ChatTable(Base):
    __tablename__ = "tbl_chat"

    chat_id = Column(Integer, primary_key=True, index=True, nullable=False)
    chat_start_date = Column(DateTime(timezone=True), nullable=False)
    chat_end_date = Column(DateTime(timezone=True))
    chat_content = Column(JSON, default={"messages":[]}, nullable=False)
    chat_summary = Column(JSON, default={"summary":""}, nullable=False)
    chat_processing = Column(Boolean, nullable=False)
    chat_token = Column(VARCHAR(255), nullable=False)
    chat_emotion_rate = Column(FLOAT, default=-1, nullable=False)
    
    # Foreign Keys
    user_id = Column(Integer, ForeignKey('tbl_user.user_id'), nullable=False)
    
    # Relationships
    user = relationship("UserTable", back_populates="chat")

class TestTable(Base):
    __tablename__ = "tbl_test"
    test_id = Column(Integer, primary_key=True, index=True, nullable=False)
    test_score = Column(SmallInteger, nullable=False)
    test_date = Column(DateTime(timezone=True), nullable=False)
    
    # Foreign Keys
    user_id = Column(Integer, ForeignKey('tbl_user.user_id'), nullable=False)
    
    # Relationships
    user = relationship("UserTable", back_populates="test")