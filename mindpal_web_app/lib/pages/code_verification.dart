import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({super.key});

  @override
  CodeVerificationState createState() => CodeVerificationState();
}

class CodeVerificationState extends State<CodeVerification> {
  final TextEditingController _codeController = TextEditingController();
  bool isCodeEmpty = false;
  bool isCodeValid = true;
  bool isTimerRunning = false;
  int countdown = 60;
  String generatedCode = '';
  Timer? timer;

  Future<void> _sendVerificationCode() async {
    final random = Random();
    generatedCode =
        (random.nextInt(900000) + 100000).toString(); // Generate 6-digit code

    final email = ModalRoute.of(context)!.settings.arguments as String;

    // Retrieve the API key from environment variables
    final sendGridApiKey = dotenv.env['SENDGRID_API_KEY'];
    if (sendGridApiKey == null) {
      // Handle the error accordingly in production
      return;
    }

    const sendGridEndpoint = 'https://api.sendgrid.com/v3/mail/send';
    const senderEmail = 'your-email@example.com'; // Your verified sender email
    const subject = 'Your Verification Code';

    final body = {
      'personalizations': [
        {
          'to': [
            {'email': email}
          ],
          'subject': subject
        }
      ],
      'from': {'email': senderEmail},
      'content': [
        {
          'type': 'text/plain',
          'value': 'Your verification code is $generatedCode'
        }
      ]
    };

    final response = await http.post(
      Uri.parse(sendGridEndpoint),
      headers: {
        'Authorization': 'Bearer $sendGridApiKey',
        'Content-Type': 'application/json'
      },
      body: json.encode(body),
    );

    if (response.statusCode == 202) {
      _startTimer();
    } else {
      // Handle the error accordingly in production
    }
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

  void _validateCode() {
    setState(() {
      isCodeEmpty = _codeController.text.isEmpty;
      isCodeValid = _codeController.text == generatedCode;

      if (!isCodeEmpty && isCodeValid) {
        Navigator.pushNamed(context, '/passwordReset');
      }
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
                '驗證碼',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _codeController,
                decoration: InputDecoration(
                  labelText: '驗證碼',
                  border: const OutlineInputBorder(),
                  errorText:
                      isCodeEmpty ? '此欄位不可為空' : (isCodeValid ? null : '驗證碼不正確'),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _validateCode,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 40), // Smaller size
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12), // Adjusted padding
                ),
                child: const Text('確認'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: isTimerRunning
                    ? null
                    : () {
                        _sendVerificationCode();
                        _startTimer();
                      },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 40), // Smaller size
                  backgroundColor: isTimerRunning ? Colors.grey : Colors.green,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12), // Adjusted padding
                ),
                child: isTimerRunning
                    ? Text("$countdown 後可重新送出")
                    : const Text('傳送驗證碼'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
