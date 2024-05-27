import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<Login> {
  bool isCounselor = true; // True for Counselor, False for Administrator
  bool isChecked = false; // Variable to hold the checked state
  bool isEmailEmpty = false;
  bool isPasswordEmpty = false;
  bool isRecaptchaEmpty = false; // Variable to hold the recaptcha state
  String errorMessage = '';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Map<String, String> users = {
    // Counselors
    'counselor1@example.com': 'password123',
    'counselor2@example.com': 'mypassword',
    'counselor3@example.com': 'securepass',
    // Administrators
    'admin1@example.com': 'adminpass',
    'admin2@example.com': 'admin123',
    'admin3@example.com': 'adm!np@ss',
  };

  final Map<String, String> roles = {
    // Counselors
    'counselor1@example.com': 'counselor',
    'counselor2@example.com': 'counselor',
    'counselor3@example.com': 'counselor',
    // Administrators
    'admin1@example.com': 'admin',
    'admin2@example.com': 'admin',
    'admin3@example.com': 'admin',
  };

  void _login() {
    setState(() {
      isEmailEmpty = _emailController.text.isEmpty;
      isPasswordEmpty = _passwordController.text.isEmpty;
      isRecaptchaEmpty = !isChecked;

      if (isEmailEmpty || isPasswordEmpty || isRecaptchaEmpty) {
        errorMessage = '';
        return;
      }
    });

    // Determine the selected role
    String selectedRole = isCounselor ? 'counselor' : 'admin';

    // Perform validation based on the selected role
    setState(() {
      if (!users.containsKey(_emailController.text)) {
        errorMessage = '此帳號不存在';
      } else if (roles[_emailController.text] != selectedRole) {
        errorMessage = '此帳號不存在';
      } else if (users[_emailController.text] != _passwordController.text) {
        errorMessage = '密碼錯誤';
      } else {
        errorMessage = '';
        Navigator.pushNamed(context, '/nextPage');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register1');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text('登入'),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          width: 360,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToggleButtons(
                isSelected: [isCounselor, !isCounselor],
                onPressed: (index) {
                  setState(() {
                    isCounselor = index == 0;
                  });
                },
                borderRadius: BorderRadius.circular(8),
                selectedBorderColor: Colors.green,
                selectedColor: Colors.white,
                fillColor: Colors.green,
                color: Colors.black,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('諮商師'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('管理員'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Center(
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              const Text('Email address'),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  errorText: isEmailEmpty ? '此欄位不可為空' : null,
                ),
              ),
              const SizedBox(height: 12),
              const Text('Password'),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  errorText: isPasswordEmpty ? '此欄位不可為空' : null,
                ),
                obscureText: true,
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isRecaptchaEmpty ? Colors.red : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                          if (isChecked) {
                            isRecaptchaEmpty = false;
                          }
                        });
                      },
                    ),
                    const Text('我不是機器人'),
                    const Spacer(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/recaptcha.png',
                          height: 18,
                          width: 18,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'reCAPTCHA',
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.grey,
                          ),
                        ),
                        const Text(
                          '隱私權 - 條款',
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              if (errorMessage.isNotEmpty)
                Center(
                  child: Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 12),
              Center(
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                  ),
                  child: const Text('Log In'),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Handle forgot password
                  },
                  child: const Text(
                    '忘記密碼？',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
