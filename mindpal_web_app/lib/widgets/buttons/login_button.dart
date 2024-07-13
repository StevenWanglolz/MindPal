import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: MyButtonStyles.firstViewButtonStyle,
        onPressed: onPressed,
        child: const Text("登入"));
  }
}
