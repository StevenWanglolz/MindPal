import 'package:flutter/material.dart';
import 'dart:async';
import 'other/email_validator.dart'; // Make sure to import the email_validator

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool isEmailValid = true;
  bool isEmailSent = false;
  bool isTimerRunning = false;
  int countdown = 60;
  Timer? timer;

  bool isEmailEmpty = false;
  bool isPasswordEmpty = false;
  bool isConfirmPasswordEmpty = false;
  bool isPasswordValid = true;
  bool isPasswordMatching = true;

  void _validateEmail() {
    setState(() {
      isEmailValid = EmailValidator.validate(_emailController.text);
      if (isEmailValid) {
        // Simulate sending SMS
        isEmailSent = true;
        _startTimer();
      } else {
        isEmailSent = false;
      }
    });
  }

  void _startTimer() {
    setState(() {
      isTimerRunning = true;
      countdown = 60;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          timer.cancel();
          isTimerRunning = false;
        }
      });
    });
  }

  bool _validatePassword(String password) {
    // Check if password is at least 6 characters long and includes letters, numbers, and symbols
    if (password.length < 6) return false;
    bool hasLetter = password.contains(RegExp(r'[A-Za-z]'));
    bool hasNumber = password.contains(RegExp(r'\d'));
    bool hasSpecialCharacter =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    return hasLetter && hasNumber && hasSpecialCharacter;
  }

  void _resetPassword() {
    setState(() {
      isEmailEmpty = _emailController.text.isEmpty;
      isPasswordEmpty = _passwordController.text.isEmpty;
      isConfirmPasswordEmpty = _confirmPasswordController.text.isEmpty;
      isPasswordValid = _validatePassword(_passwordController.text);
      isPasswordMatching =
          _passwordController.text == _confirmPasswordController.text;

      if (isEmailEmpty ||
          isPasswordEmpty ||
          isConfirmPasswordEmpty ||
          !isEmailValid ||
          !isPasswordValid ||
          !isPasswordMatching ||
          !isEmailSent) {
        // Handle the case when inputs are invalid
        return;
      }

      // Proceed with password reset logic
      Navigator.pushNamed(context, '/nextPage'); // Ensure this route exists
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 20,
                ),
                SizedBox(width: 10),
                Text(
                  'MindPal',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child:
                      Text('Log in', style: TextStyle(color: Colors.grey[600])),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register1');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text('Sign up',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '忘記密碼',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: '電子郵件',
                  border: const OutlineInputBorder(),
                  errorText: isEmailEmpty
                      ? '此欄位不可為空'
                      : (isEmailValid ? null : 'Email is not valid'),
                  suffixIcon: SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: isTimerRunning ? null : _validateEmail,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.zero,
                        textStyle: const TextStyle(fontSize: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(isTimerRunning ? ' $countdown s' : '傳送驗證碼'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: '輸入新密碼',
                  border: const OutlineInputBorder(),
                  errorText: isPasswordEmpty
                      ? '此欄位不可為空'
                      : (isPasswordValid ? null : '密碼須包含至少 6 個字符，包括字母、數字和符號'),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  labelText: '確認密碼',
                  border: const OutlineInputBorder(),
                  errorText: isConfirmPasswordEmpty
                      ? '此欄位不可為空'
                      : (isPasswordMatching ? null : '密碼不匹配'),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: isEmailSent ? _resetPassword : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: isEmailSent ? Colors.green : Colors.grey,
                ),
                child: const Text('重設密碼'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
