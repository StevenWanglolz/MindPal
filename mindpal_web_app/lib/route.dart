// import 'package:flutter/material.dart';
// import 'pages/register1.dart';
// import 'pages/register2.dart';
// import 'pages/login.dart';

// import 'package:logger/logger.dart';

// class RouteGenerator {
//   static final Logger _logger = Logger(
//     printer: PrettyPrinter(
//         methodCount: 0, // number of method calls to be displayed
//         errorMethodCount: 5, // number of method calls if an error is thrown
//         lineLength: 50, // width of the output
//         colors: true, // Colorful log messages
//         printEmojis: true, // Print emojis for each log message
//         printTime: true // Should each log print contain a timestamp
//         ),
//   );

//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     _logger.d("Requested route: ${settings.name}");

//     switch (settings.name) {
//       case '/register1':
//         _logger.d("Navigating to Register1 page");
//         return MaterialPageRoute(builder: (_) => const Register1());
//       case '/register2':
//         _logger.d("Navigating to Register2 page");
//         return MaterialPageRoute(builder: (_) => const Register2());
//       case '/login':
//         _logger.d("Navigating to Login page");
//         return MaterialPageRoute(builder: (_) => const Login());
//       case '/forget_password':
//         _logger.d("Navigating to ForgetPassword");
//           return MaterialPageRoute(builder = (_)) => const ForgotPassword();
//       default:
//         _logger.w("Route not found, showing error page");
//         return _errorRoute();
//     }
//   }

//   static Route<dynamic> _errorRoute() {
//     _logger.e("Generating error route");
//     return MaterialPageRoute(
//       builder: (_) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('Error'),
//           ),
//           body: const Center(
//             child: Text('ERROR: Route not found'),
//           ),
//         );
//       },
//     );
//   }
// }
