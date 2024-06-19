import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // No back button
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align logo and title to the left
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 40,
            ),
            const SizedBox(width: 5), // Adjust spacing between logo and title
            const Text(
              'MindPal',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(), // Add space between title and button
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
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[200],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    '成為MindPal的諮商師...',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text('What\'s your gender?',
                      style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Female'),
                          value: 'Female',
                          groupValue: 'gender',
                          onChanged: (value) {},
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Male'),
                          value: 'Male',
                          groupValue: 'gender',
                          onChanged: (value) {},
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Non-binary'),
                          value: 'Non-binary',
                          groupValue: 'gender',
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text('您的諮商證照發行日期', style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(labelText: 'Month'),
                          items: List.generate(12, (index) {
                            return DropdownMenuItem(
                              value: (index + 1).toString(),
                              child: Text((index + 1).toString()),
                            );
                          }),
                          onChanged: (value) {},
                        ),
                      ),
                      const SizedBox(
                          width: 8.0), // Add some space between the fields
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(labelText: 'Date'),
                          items: List.generate(31, (index) {
                            return DropdownMenuItem(
                              value: (index + 1).toString(),
                              child: Text((index + 1).toString()),
                            );
                          }),
                          onChanged: (value) {},
                        ),
                      ),
                      const SizedBox(
                          width: 8.0), // Add some space between the fields
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(labelText: 'Year'),
                          items: List.generate(50, (index) {
                            return DropdownMenuItem(
                              value: (2024 - index).toString(),
                              child: Text((2024 - index).toString()),
                            );
                          }),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: '上傳諮商證照 格式限制:.pdf',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 8.0), // Add some space between the fields
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text('選擇檔案'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: '諮商專長',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 8.0), // Add some space between the fields
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text('選擇專長'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text('Agree to our '),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Terms of use'),
                      ),
                      const Text(' and '),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Privacy Policy'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register2');
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Sign up'),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Center(
                    child: Text('Already have an account?'),
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
                        'Log In',
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
