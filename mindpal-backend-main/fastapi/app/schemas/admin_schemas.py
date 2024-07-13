from pydantic import BaseModel


class CreateAdminRequest(BaseModel):
    email: str
    hashed_password: str
    name: str
    salt: str
    
class CreateAdminResponse(BaseModel):
    status: bool
    detail: str

class AdminGetSaltResponse(BaseModel):
    status: bool
    salt: str    
    detail: str
class AdminLoginRequest(BaseModel):
    email: str
    hashed_password: str

class AdminLoginResponse(BaseModel):
    login_status: bool
    token: str
    detail: str
    
class UpdateAdminRequest(BaseModel):
    token: str
    name: str
    
class UpdateAdminResponse(BaseModel):
    status: bool
    new_info: dict
    detail: str   