// import 'package:flutter/material.dart';
// import 'package:email_validator/email_validator.dart';

// class ForgotPassword extends StatefulWidget {
//   const ForgotPassword({super.key});

//   @override
//   ForgotPasswordState createState() => ForgotPasswordState();
// }

// class ForgotPasswordState extends State<ForgotPassword> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _obscurePassword = true;
//   bool isEmailValid = true;
//   bool isEmailSent = false;

//   void _validateEmail() {
//     setState(() {
//       isEmailValid = EmailValidator.validate(_emailController.text);
//       if (isEmailValid) {
//         // Simulate sending SMS
//         isEmailSent = true;
//       } else {
//         isEmailSent = false;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         toolbarHeight: 80,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.grey,
//                   radius: 20,
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   'MindPal',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/login');
//                   },
//                   child:
//                       Text('Log in', style: TextStyle(color: Colors.grey[600])),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/register1');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                   ),
//                   child: const Text('Sign up',
//                       style: TextStyle(color: Colors.white)),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           width: 400,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 8,
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text(
//                     'Back',
//                     style: TextStyle(color: Colors.green),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 '忘記密碼',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: const OutlineInputBorder(),
//                   errorText: isEmailValid ? null : 'Email is not valid',
//                   suffixIcon: TextButton(
//                     onPressed: _validateEmail,
//                     child: const Text('傳送驗證碼'),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: _passwordController,
//                 obscureText: _obscurePassword,
//                 decoration: InputDecoration(
//                   labelText: '輸入新密碼',
//                   border: const OutlineInputBorder(),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscurePassword
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscurePassword = !_obscurePassword;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 obscureText: _obscurePassword,
//                 decoration: InputDecoration(
//                   labelText: 'Confirm Password',
//                   border: const OutlineInputBorder(),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscurePassword
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscurePassword = !_obscurePassword;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: isEmailSent ? () {} : null,
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 50),
//                   backgroundColor: isEmailSent ? Colors.green : Colors.grey,
//                 ),
//                 child: const Text('重設密碼'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
