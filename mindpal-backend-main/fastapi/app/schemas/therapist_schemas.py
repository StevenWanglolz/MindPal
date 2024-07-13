import base64

from pydantic import BaseModel

from fastapi import HTTPException, status


class CreateTherapistRequest(BaseModel):
    email:str
    gender: int
    hashed_password:str
    phone: str
    salt: str
    name: str
    info: str
    specialty: list
    
class CreateTherapistResponse(BaseModel):
    status: bool
    detail: str
    
class TherapistGetSaltResponse(BaseModel):
    status: bool
    salt: str
    detail: str
class TherapistLoginRequest(BaseModel):
    email:str
    hashed_password:str

class TherapistLoginResponse(BaseModel):
    status: bool
    token: str
    therapist_info: dict
    detail: str
    
class UpdateTherapistRequest(BaseModel):
    token: str
    gender: int
    info: str
    name: str
    phone: str
    specialty: list
    
class UpdateTherapistResponse(BaseModel):
    status: bool
    detail: str
    
class DeleteTherapistResponse(BaseModel):
    status: bool
    detail: str
    
class TherapistForgetPasswordRequest(BaseModel):
    email: str    
    
class TherapistForgetPasswordResponse(BaseModel):
    status: bool
    token: str
    detail: str
    
class TherapistVerifyCodeRequest(BaseModel):
    verification_code: str
    token: str
    
class TherapistVerifyCodeResponse(BaseModel):
    status: bool
    token: str
    detail: str
    
class TherapistResendVerificationCodeRequest(BaseModel):
    token: str
    
class TherapistResendVerificationCodeResponse(BaseModel):
    status: bool
    detail: str    
    
class TherapistResetPasswordRequest(BaseModel):
    token: str
    new_salt: str
    new_hashed_password: str
    
class TherapistResetPasswordResponse(BaseModel):
    status: bool
    detail: str    
    
class TherapistVerifyRequest(BaseModel):
    token: str
    verification_code: str
    
class TherapistVerifyResponse(BaseModel):
    status: bool
    detail: str
    
class TherapistSendVerificationCodeResponse(BaseModel):
    status: bool
    token: str
    detail: str
    
class AdminUpdateTherapistCertVerifiedRequest(BaseModel):
    login_token: str
    verified: bool
    therapist_email: str    
    
class AdminUpdateTherapistCertVerifiedResponse(BaseModel):
    status: bool
    detail: str

class TherapistUploadCertPhotoRequest(BaseModel):
    login_token: str
    cert_photo: str
    
class TherapistUploadCertPhotoResponse(BaseModel):
    status: bool
    detail: str