import 'package:flutter/material.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  Register2State createState() => Register2State();
}

class Register2State extends State<Register2> {
  String? _selectedGender;
  String _selectedMonth = '';
  String _selectedDate = '';
  String _selectedYear = '';
  bool _agreedToTOS = false;

  bool isGenderEmpty = false;
  bool isDateOfIssueEmpty = false;
  bool isSpecialtyEmpty = false;

  final TextEditingController _specialtyController = TextEditingController();

  void _validateAndProceed() {
    setState(() {
      isGenderEmpty = _selectedGender == null;
      isDateOfIssueEmpty = _selectedMonth.isEmpty ||
          _selectedDate.isEmpty ||
          _selectedYear.isEmpty;
      isSpecialtyEmpty = _specialtyController.text.isEmpty;

      if (!isGenderEmpty &&
          !isDateOfIssueEmpty &&
          !isSpecialtyEmpty &&
          _agreedToTOS) {
        // Navigate to the next page or perform the sign-up action
        Navigator.pushNamed(context, '/nextPage');
      }
    });
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
                    fontWeight: FontWeight.bold,
                  ),
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
                  child: const Text('Log in'),
                ),
                const SizedBox(width: 10),
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
                    const Text(
                      '成為MindPal的諮商師...',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'What\'s your gender?',
                      style: TextStyle(fontSize: 16),
                    ),
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
                                isGenderEmpty = false;
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
                                isGenderEmpty = false;
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
                                isGenderEmpty = false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    if (isGenderEmpty)
                      const Text(
                        '此欄位不可為空',
                        style: TextStyle(color: Colors.red),
                      ),
                    const SizedBox(height: 16),
                    const Text('您的諮商證照發行日期', style: TextStyle(fontSize: 16)),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Month',
                              border: OutlineInputBorder(),
                            ),
                            items: List.generate(12, (index) {
                              return DropdownMenuItem(
                                value: (index + 1).toString(),
                                child: Text((index + 1).toString()),
                              );
                            }),
                            onChanged: (value) {
                              setState(() {
                                _selectedMonth = value ?? '';
                                isDateOfIssueEmpty = false;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Date',
                              border: OutlineInputBorder(),
                            ),
                            items: List.generate(31, (index) {
                              return DropdownMenuItem(
                                value: (index + 1).toString(),
                                child: Text((index + 1).toString()),
                              );
                            }),
                            onChanged: (value) {
                              setState(() {
                                _selectedDate = value ?? '';
                                isDateOfIssueEmpty = false;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Year',
                              border: OutlineInputBorder(),
                            ),
                            items: List.generate(50, (index) {
                              return DropdownMenuItem(
                                value: (2024 - index).toString(),
                                child: Text((2024 - index).toString()),
                              );
                            }),
                            onChanged: (value) {
                              setState(() {
                                _selectedYear = value ?? '';
                                isDateOfIssueEmpty = false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    if (isDateOfIssueEmpty)
                      const Text(
                        '此欄位不可為空',
                        style: TextStyle(color: Colors.red),
                      ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _specialtyController,
                      decoration: InputDecoration(
                        labelText: '諮商專長',
                        border: const OutlineInputBorder(),
                        errorText: isSpecialtyEmpty ? '此欄位不可為空' : null,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Handle file upload
                      },
                      child: const Text('選擇檔案'),
                    ),
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: _agreedToTOS ? _validateAndProceed : null,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 40),
                          backgroundColor: Colors.green,
                        ),
                        child: const Text('Sign up'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(color: Colors.black),
                          ),
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
