import 'package:flutter/material.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});

  @override
  Register1State createState() => Register1State();
}

class Register1State extends State<Register1> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  bool isUsernameEmpty = false;
  bool isEmailEmpty = false;
  bool isPhoneEmpty = false;
  bool isPasswordEmpty = false;
  bool isPasswordValid = true;

  void _validateAndProceed() {
    setState(() {
      isUsernameEmpty = _usernameController.text.isEmpty;
      isEmailEmpty = _emailController.text.isEmpty;
      isPhoneEmpty = _phoneController.text.isEmpty;
      isPasswordEmpty = _passwordController.text.isEmpty;
      isPasswordValid = _validatePassword(_passwordController.text);

      if (!isUsernameEmpty &&
          !isEmailEmpty &&
          !isPhoneEmpty &&
          !isPasswordEmpty &&
          isPasswordValid) {
        Navigator.pushNamed(context, '/register2');
      }
    });
  }

  bool _validatePassword(String password) {
    if (password.length < 6) return false;
    bool hasLetter = password.contains(RegExp(r'[A-Za-z]'));
    bool hasDigit = password.contains(RegExp(r'\d'));
    bool hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    return hasLetter && hasDigit && hasSpecialChar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // No back button
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/brain.png',
                  height: 40,
                ),
                const SizedBox(width: 10),
                const Text(
                  'MindPal',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text('登入'),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[200],
              child: Center(
                child: Image.asset(
                  'assets/images/Empty.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    '成為MindPal的諮商師...',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: '姓名',
                      border: const OutlineInputBorder(),
                      errorText: isUsernameEmpty ? '此欄位不可為空' : null,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: '電子信箱',
                      border: const OutlineInputBorder(),
                      errorText: isEmailEmpty ? '此欄位不可為空' : null,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: '電話',
                      border: const OutlineInputBorder(),
                      errorText: isPhoneEmpty ? '此欄位不可為空' : null,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: '密碼',
                      border: const OutlineInputBorder(),
                      errorText: isPasswordEmpty
                          ? '此欄位不可為空'
                          : (!isPasswordValid
                              ? '密碼必須包含至少6個字符，包括字母，數字和符號'
                              : null),
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
                      helperText:
                          'Use 8 or more characters with a mix of letters, numbers & symbols',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _validateAndProceed,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 40),
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('下一頁'),
                  ),
                  const SizedBox(height: 16.0),
                  const Center(
                    child: Text('已用有帳號?'),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: const Text(
                        '登入',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
