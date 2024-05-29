import 'package:flutter/material.dart';
import 'pages/email_verification.dart';
import 'pages/code_verification.dart';
import 'pages/password_reset.dart';
import 'pages/login.dart';
import 'pages/register1.dart';
import 'pages/register2.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Register1());
      case '/emailVerification':
        return MaterialPageRoute(builder: (_) => const EmailVerification());
      case '/codeVerification':
        return MaterialPageRoute(builder: (_) => const CodeVerification());
      case '/passwordReset':
        return MaterialPageRoute(builder: (_) => const PasswordReset());
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/register2':
        return MaterialPageRoute(builder: (_) => const Register2());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR: Route not found'),
          ),
        );
      },
    );
  }
}
