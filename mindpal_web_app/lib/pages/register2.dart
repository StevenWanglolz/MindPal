import 'package:flutter/material.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  Register2State createState() => Register2State();
}

class Register2State extends State<Register2> {
  String? _selectedGender;
  String _dateOfIssue = '';
  bool _agreedToTOS = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/brain.png', // Make sure you add your custom icon image in the assets folder and mention it in pubspec.yaml
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
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('Log In',
                      style: TextStyle(color: Colors.black)),
                ),
                const SizedBox(width: 10),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/register1');
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.green,
                //     padding: const EdgeInsets.symmetric(horizontal: 20),
                //   ),
                //   child: const Text('Sign Up'),
                // ),
              ],
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[200], // Blank left side
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('成為MindPal的諮商師...',
                        style: TextStyle(fontSize: 24)),
                    const SizedBox(height: 20),
                    const Text('What\'s your gender?',
                        style: TextStyle(fontSize: 16)),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Female'),
                            value: 'Female',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Male'),
                            value: 'Male',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Non-binary'),
                            value: 'Non-binary',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text('您的諮商證照發行日期', style: TextStyle(fontSize: 16)),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration:
                                const InputDecoration(labelText: 'Month'),
                            items: List.generate(12, (index) {
                              return DropdownMenuItem(
                                value: (index + 1).toString(),
                                child: Text((index + 1).toString()),
                              );
                            }),
                            onChanged: (value) {
                              setState(() {
                                _dateOfIssue = value ?? '';
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration:
                                const InputDecoration(labelText: 'Date'),
                            items: List.generate(31, (index) {
                              return DropdownMenuItem(
                                value: (index + 1).toString(),
                                child: Text((index + 1).toString()),
                              );
                            }),
                            onChanged: (value) {
                              setState(() {
                                _dateOfIssue = value ?? '';
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration:
                                const InputDecoration(labelText: 'Year'),
                            items: List.generate(50, (index) {
                              return DropdownMenuItem(
                                value: (2024 - index).toString(),
                                child: Text((2024 - index).toString()),
                              );
                            }),
                            onChanged: (value) {
                              setState(() {
                                _dateOfIssue = value ?? '';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Handle file upload
                      },
                      child: const Text('選擇檔案'),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(labelText: '諮商專長'),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: _agreedToTOS,
                          onChanged: (value) {
                            setState(() {
                              _agreedToTOS = value ?? false;
                            });
                          },
                        ),
                        const Text('Agree to our '),
                        TextButton(
                          onPressed: () {
                            // Handle terms of use navigation
                          },
                          child: const Text('Terms of use'),
                        ),
                        const Text(' and '),
                        TextButton(
                          onPressed: () {
                            // Handle privacy policy navigation
                          },
                          child: const Text('Privacy Policy'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: _agreedToTOS
                            ? () {
                                // Handle sign up
                              }
                            : null,
                        child: const Text('Sign up'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account? ',
                              style: TextStyle(color: Colors.black)),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text('Log in'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
