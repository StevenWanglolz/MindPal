import 'package:flutter/material.dart';
import 'pages/adminMain.dart';
import 'pages/counselorMainNoCerti.dart';
import 'pages/counselorMainWithCerti.dart';
import 'pages/email_verification.dart';
import 'pages/code_verification.dart';
import 'pages/password_reset.dart';
// import 'pages/login.dart';
import 'pages/register1.dart';
import 'pages/register2.dart';
import 'pages/counselorLogin.dart';
import 'pages/adminLogin.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/register1':
        return MaterialPageRoute(builder: (_) => const Register1());
      case '/emailVerification':
        return MaterialPageRoute(builder: (_) => const EmailVerification());
      case '/codeVerification':
        return MaterialPageRoute(builder: (_) => const CodeVerification());
      case '/passwordReset':
        return MaterialPageRoute(builder: (_) => const PasswordReset());
      // case '/login':
      //   return MaterialPageRoute(builder: (_) => const Login());
      case '/register2':
        return MaterialPageRoute(builder: (_) => const Register2());
      case '/counselorLogin':
        return MaterialPageRoute(builder: (_) => const CounselorLogin());
      case '/adminLogin':
        return MaterialPageRoute(builder: (_) => const AdminLogin());
      case '/adminMain':
        return MaterialPageRoute(builder: (_) => const AdminMain());
      case '/counselorMainNoCerti':
        return MaterialPageRoute(builder: (_) => const CounselorMainNoCerti());
      case '/counselorMainWithCerti':
        return MaterialPageRoute(
            builder: (_) => const CounselorMainWithCerti());
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
