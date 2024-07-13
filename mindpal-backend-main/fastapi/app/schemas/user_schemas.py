from pydantic import BaseModel


class CreateUserRequest(BaseModel):
    email: str
    emergency_contact: str
    emergency_contact_email: str
    emergency_contact_phone: str
    gender: str
    hashed_password: str
    name: str
    phone: str
    salt: str
    
class CreateUserResponse(BaseModel):
    status: bool
    detail: str
    
class ReadUserResponse(BaseModel):
    status: bool
    user_info: dict
    detail: str
    
class UserGetSaltRequest(BaseModel):
    email: str
class UserGetSaltResponse(BaseModel):
    status: bool
    salt: str
    detail: str
class UserLoginRequest(BaseModel):
    email: str
    hashed_password: str
class UserLoginResponse(BaseModel):
    status: bool
    token: str
    user_info: dict
    detail: str
    
class UpdateUserRequest(BaseModel):
    token: str
    emergency_contact: str
    emergency_contact_email: str
    emergency_contact_phone: str
    gender: int
    name: str
    phone: str
    
class UpdateUserResponse(BaseModel):
    status: bool
    detail: str
    
class DeleteUserResponse(BaseModel):
    status: bool
    detail: str
    
class UserForgetPasswordRequest(BaseModel):
    email: str    
    
class UserForgetPasswordResponse(BaseModel):
    status: bool
    token: str
    detail: str
    
class UserVerifyCodeRequest(BaseModel):
    verification_code: str
    token: str
    
class UserVerifyCodeResponse(BaseModel):
    status: bool
    token: str
    detail: str
    
class UserResendVerificationCodeRequest(BaseModel):
    token: str
    
class UserResendVerificationCodeResponse(BaseModel):
    status: bool
    detail: str
    
class UserResetPasswordRequest(BaseModel):
    token: str
    new_salt: str
    new_hashed_password: str
    
class UserResetPasswordResponse(BaseModel):
    status: bool
    detail: str
    
class UserVerifyRequest(BaseModel):
    token: str
    verification_code: str
    
class UserVerifyResponse(BaseModel):
    status: bool
    detail: str
    
class UserSendVerificationCodeResponse(BaseModel):
    status: bool
    token: str
    detail: str