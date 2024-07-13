import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';

class NameTextField extends StatefulWidget {
  final TextEditingController controller;
  const NameTextField({super.key, required this.controller});

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  String _nameError = "";
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintStyle: MyTextStyles.hintTextStyle,
        hintText: "例: 王大同(請使用真實姓名)",
        errorText: _nameError.isNotEmpty ? _nameError : null,
        label: const Text("姓名"),
        labelStyle: TextStyle(color: UIColors.darkGreen),
        filled: true,
        fillColor: UIColors.grey1,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: UIColors.grey3, width: 2),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: UIColors.grey3),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: UIColors.lightGreen, width: 2),
            borderRadius: BorderRadius.circular(8)),
      ),
      keyboardType: TextInputType.name,
      onChanged: (value) {
        //名字不能有空格且不能有特殊符號, 但可以是中文和英文
        if (!RegExp(r"^[\u4e00-\u9fa5a-zA-Z]+$").hasMatch(value) ||
            value.contains(" ")) {
          setState(() {
            _nameError = "請輸入正確的姓名";
          });
        } else {
          setState(() {
            _nameError = "";
          });
        }
      },
    );
  }
}

class PhoneTextField extends StatefulWidget {
  final TextEditingController controller;
  const PhoneTextField({super.key, required this.controller});

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  String _phoneError = "";
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintStyle: MyTextStyles.hintTextStyle,
        hintText: "例: 0912345678",
        errorText: _phoneError.isNotEmpty ? _phoneError : null,
        label: const Text("手機號碼"),
        labelStyle: TextStyle(color: UIColors.darkGreen),
        filled: true,
        fillColor: UIColors.grey1,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: UIColors.grey3, width: 2),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: UIColors.grey3),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: UIColors.lightGreen, width: 2),
            borderRadius: BorderRadius.circular(8)),
      ),
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        //檢查手機號碼是否是09開頭且總共為10碼的數字字串
        if (RegExp(r"09\d{8}").hasMatch(value) &&
            value.length == 10 &&
            !value.contains(" ")) {
          setState(() {
            _phoneError = "";
          });
        } else {
          setState(() {
            _phoneError = "請輸入正確的手機號碼";
          });
        }
      },
    );
  }
}

class EmailTextField extends StatefulWidget {
  final TextEditingController controller;
  const EmailTextField({super.key, required this.controller});

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  String _emailError = "";
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintStyle: MyTextStyles.hintTextStyle,
        label: const Text("電子信箱"),
        labelStyle: TextStyle(color: UIColors.darkGreen),
        hintText: "例: example@gmail.com",
        errorText: _emailError.isNotEmpty ? _emailError : null,
        filled: true,
        fillColor: UIColors.grey1,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: UIColors.grey3, width: 2),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: UIColors.grey3),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: UIColors.lightGreen, width: 2),
            borderRadius: BorderRadius.circular(8)),
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => {
        // 在這裡檢查電子郵箱的格式，並根據需要顯示錯誤訊息
        if (!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value) ||
            value.contains(" "))
          {
            // 電子郵箱格式不正確，顯示錯誤訊息
            setState(() {
              _emailError = '請輸入正確的電子信箱格式';
            })
          }
        else
          {
            // 電子郵箱格式正確，清除錯誤訊息
            setState(() {
              _emailError = "";
            })
          }
      },
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordTextField({super.key, required this.controller});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _passwordVisible = true;
  String _passwordError = "";
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _passwordVisible,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          label: const Text("密碼"),
          labelStyle: TextStyle(color: UIColors.darkGreen),
          hintText: "至少8字, 只能使用英文和數字",
          hintStyle: MyTextStyles.hintTextStyle,
          errorText: _passwordError.isNotEmpty ? _passwordError : null,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.grey3, width: 2),
              borderRadius: BorderRadius.circular(8.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.grey3),
              borderRadius: BorderRadius.circular(8.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.lightGreen, width: 2),
              borderRadius: BorderRadius.circular(8.0)),
          suffixIcon: IconButton(
            icon: Icon(
                _passwordVisible ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          alignLabelWithHint: false,
          filled: true,
          fillColor: UIColors.grey1),
      onChanged: (value) => {
        // 在這裡檢查密碼的格式，只少需要8個字，並且只能使用英文和數字
        if (value.length < 8 || !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value))
          {
            // 密碼格式不正確，顯示錯誤訊息
            setState(() {
              _passwordError = '密碼格式不正確';
            })
          }
        else
          {
            // 密碼格式正確，清除錯誤訊息
            setState(() {
              _passwordError = "";
            })
          }
      },
    );
  }
}

class CheckPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  const CheckPasswordTextField({super.key, required this.controller});

  @override
  State<CheckPasswordTextField> createState() => _CheckPasswordTextFieldState();
}

class _CheckPasswordTextFieldState extends State<CheckPasswordTextField> {
  bool _passwordVisible = true;
  String _passwordError = "";
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _passwordVisible,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          label: const Text("確認密碼"),
          labelStyle: TextStyle(color: UIColors.darkGreen),
          hintText: "請再次輸入密碼",
          hintStyle: MyTextStyles.hintTextStyle,
          errorText: _passwordError.isNotEmpty ? _passwordError : null,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.grey3, width: 2),
              borderRadius: BorderRadius.circular(8.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.grey3),
              borderRadius: BorderRadius.circular(8.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.lightGreen, width: 2),
              borderRadius: BorderRadius.circular(8.0)),
          suffixIcon: IconButton(
            icon: Icon(
                _passwordVisible ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          alignLabelWithHint: false,
          filled: true,
          fillColor: UIColors.grey1),
      onChanged: (value) => {
        // 在這裡檢查密碼的格式，只少需要8個字，並且只能使用英文和數字
        if (value.length < 8 || !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value))
          {
            // 密碼格式不正確，顯示錯誤訊息
            setState(() {
              _passwordError = '密碼格式不正確';
            })
          }
        else
          {
            // 密碼格式正確，清除錯誤訊息
            setState(() {
              _passwordError = "";
            })
          }
      },
    );
  }
}

class EmergencyContactNameTextField extends StatefulWidget {
  final TextEditingController controller;
  const EmergencyContactNameTextField({super.key, required this.controller});

  @override
  State<EmergencyContactNameTextField> createState() =>
      _EmergencyContactNameTextFieldState();
}

class _EmergencyContactNameTextFieldState
    extends State<EmergencyContactNameTextField> {
  String _emergencyContactNameError = "";
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          hintStyle: MyTextStyles.hintTextStyle,
          hintText: "例: 陳小明",
          errorText: _emergencyContactNameError.isNotEmpty
              ? _emergencyContactNameError
              : null,
          label: const Text("緊急聯絡姓名"),
          labelStyle: TextStyle(color: UIColors.darkGreen),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.grey3, width: 2),
              borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.grey3),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.lightGreen, width: 2),
              borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: UIColors.grey1),
      onChanged: (value) {
        //名字不能有空格且不能有特殊符號, 但可以是中文和英文
        if (!RegExp(r"^[\u4e00-\u9fa5a-zA-Z]+$").hasMatch(value) ||
            value.contains(" ")) {
          setState(() {
            _emergencyContactNameError = "請輸入正確的姓名";
          });
        } else {
          setState(() {
            _emergencyContactNameError = "";
          });
        }
      },
    );
  }
}

class EmergencyContactEmailTextField extends StatefulWidget {
  final TextEditingController controller;
  const EmergencyContactEmailTextField({super.key, required this.controller});

  @override
  State<EmergencyContactEmailTextField> createState() =>
      _EmergencyContactEmailTextFieldState();
}

class _EmergencyContactEmailTextFieldState
    extends State<EmergencyContactEmailTextField> {
  String _emergencyContactEmailError = '';
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintStyle: MyTextStyles.hintTextStyle,
          hintText: "例: exmaple@gmail.com",
          errorText: _emergencyContactEmailError.isNotEmpty
              ? _emergencyContactEmailError
              : null,
          label: const Text("緊急聯絡人信箱"),
          labelStyle: TextStyle(color: UIColors.darkGreen),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.grey3, width: 2),
              borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.grey3),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.lightGreen, width: 2),
              borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: UIColors.grey1),
      onChanged: (value) => {
        // 在這裡檢查電子郵箱的格式，並根據需要顯示錯誤訊息
        if (!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value) ||
            value.contains(" "))
          {
            // 電子郵箱格式不正確，顯示錯誤訊息
            setState(() {
              _emergencyContactEmailError = '請輸入正確的電子信箱格式';
            })
          }
        else
          {
            // 電子郵箱格式正確，清除錯誤訊息
            setState(() {
              _emergencyContactEmailError = "";
            })
          }
      },
    );
  }
}

class EmergencyContactPhoneTextField extends StatefulWidget {
  final TextEditingController controller;
  const EmergencyContactPhoneTextField({super.key, required this.controller});

  @override
  State<EmergencyContactPhoneTextField> createState() =>
      _EmergencyContactPhoneTextFieldState();
}

class _EmergencyContactPhoneTextFieldState
    extends State<EmergencyContactPhoneTextField> {
  String _emergencyContactPhoneError = '';
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintStyle: MyTextStyles.hintTextStyle,
          hintText: "例: 0912345678",
          errorText: _emergencyContactPhoneError.isNotEmpty
              ? _emergencyContactPhoneError
              : null,
          label: const Text("緊急聯絡人電話"),
          labelStyle: TextStyle(color: UIColors.darkGreen),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.grey3, width: 2),
              borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.grey3),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.lightGreen, width: 2),
              borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: UIColors.grey1),
      onChanged: (value) {
        //檢查手機號碼是否是09開頭且總共為10碼的數字字串
        if (RegExp(r"09\d{8}").hasMatch(value) &&
            value.length == 10 &&
            !value.contains(" ")) {
          setState(() {
            _emergencyContactPhoneError = "";
          });
        } else {
          setState(() {
            _emergencyContactPhoneError = "請輸入正確的手機號碼";
          });
        }
      },
    );
  }
}

class CertTextField extends StatelessWidget {
  final TextEditingController controller;
  const CertTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintStyle: MyTextStyles.hintTextStyle,
        hintText: "驗證碼(xxxxxx)",
        label: const Text("驗證碼"),
        labelStyle: TextStyle(color: UIColors.darkGreen),
        filled: true,
        fillColor: UIColors.grey1,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: UIColors.grey3, width: 2),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: UIColors.grey3),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: UIColors.lightGreen, width: 2),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class NewPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  const NewPasswordTextField({super.key, required this.controller});

  @override
  State<NewPasswordTextField> createState() => _NewPasswordTextFieldState();
}

class _NewPasswordTextFieldState extends State<NewPasswordTextField> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: passwordVisible,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          label: const Text("新密碼"),
          labelStyle: TextStyle(color: UIColors.darkGreen),
          hintText: "新密碼",
          hintStyle: MyTextStyles.hintTextStyle,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.grey3, width: 2),
              borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.grey3),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.lightGreen, width: 2),
              borderRadius: BorderRadius.circular(8)),
          suffixIcon: IconButton(
            icon:
                Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),
          alignLabelWithHint: false,
          filled: true,
          fillColor: UIColors.grey1),
    );
  }
}

class CheckNewPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  const CheckNewPasswordTextField({super.key, required this.controller});

  @override
  State<CheckNewPasswordTextField> createState() =>
      _CheckNewPasswordTextFieldState();
}

class _CheckNewPasswordTextFieldState extends State<CheckNewPasswordTextField> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: passwordVisible,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          label: const Text("確認新密碼"),
          labelStyle: TextStyle(color: UIColors.darkGreen),
          hintText: "確認新密碼",
          hintStyle: MyTextStyles.hintTextStyle,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.grey3, width: 2),
              borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.grey3),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UIColors.lightGreen, width: 2),
              borderRadius: BorderRadius.circular(8)),
          suffixIcon: IconButton(
            icon:
                Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),
          alignLabelWithHint: false,
          filled: true,
          fillColor: UIColors.grey1),
    );
  }
}
