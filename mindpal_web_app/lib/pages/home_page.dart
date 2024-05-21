import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the second page
            Navigator.pushNamed(context, '/second');
          },
          child: Text('Go to Second Page'),
        ),
      ),
    );
  }
}
