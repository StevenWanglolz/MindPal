import 'package:flutter/material.dart';
import 'pages/register1.dart';
import 'pages/register2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Register1(),
        '/register2': (context) =>
            const Register2(), // Define the route for SecondPage
      },
    );
  }
}
