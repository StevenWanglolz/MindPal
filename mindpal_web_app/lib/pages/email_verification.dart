import 'package:flutter/material.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  EmailVerificationState createState() => EmailVerificationState();
}

class EmailVerificationState extends State<EmailVerification> {
  final TextEditingController _emailController = TextEditingController();
  bool isEmailValid = true;
  bool isEmailEmpty = false;

  final List<String> validEmails = [
    'example1@example.com',
    'example2@example.com',
    'example3@example.com',
    'example4@example.com',
    'example5@example.com'
  ];

  void _validateEmail() {
    setState(() {
      isEmailEmpty = _emailController.text.isEmpty;
      isEmailValid = validEmails.contains(_emailController.text);
      if (!isEmailEmpty && isEmailValid) {
        Navigator.pushNamed(context, '/codeVerification',
            arguments: _emailController.text);
      }
    });
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
                      : (isEmailValid ? null : '此電子郵件不存在'),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _validateEmail,
                style: ElevatedButton.styleFrom(
                  minimumSize:
                      const Size(double.infinity, 40), // Adjusted height
                  backgroundColor: Colors.green,
                ),
                child: const Text('下一步'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
