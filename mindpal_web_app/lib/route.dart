import 'package:flutter/material.dart';
import 'pages/register1.dart';
import 'pages/register2.dart';
import 'pages/login.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Register1());
      case '/register2':
        return MaterialPageRoute(builder: (_) => const Register2());
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
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
