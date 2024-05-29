import 'package:flutter/material.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  PasswordResetState createState() => PasswordResetState();
}

class PasswordResetState extends State<PasswordReset> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool isPasswordEmpty = false;
  bool isConfirmPasswordEmpty = false;
  bool isPasswordValid = true;
  bool isPasswordMatching = true;

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
      isPasswordEmpty = _passwordController.text.isEmpty;
      isConfirmPasswordEmpty = _confirmPasswordController.text.isEmpty;
      isPasswordValid = _validatePassword(_passwordController.text);
      isPasswordMatching =
          _passwordController.text == _confirmPasswordController.text;

      if (isPasswordEmpty ||
          isConfirmPasswordEmpty ||
          !isPasswordValid ||
          !isPasswordMatching) {
        // Handle the case when inputs are invalid
        return;
      }

      // Proceed with password reset logic
      // Here you would send the new password to the server and handle the response
      // For this example, we simply navigate to the next page
      Navigator.pushNamed(context, '/login'); // Ensure this route exists
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Log in', style: TextStyle(color: Colors.grey[600])),
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
                '輸入新密碼',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: '新密碼',
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
                onPressed: _resetPassword,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.green,
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
