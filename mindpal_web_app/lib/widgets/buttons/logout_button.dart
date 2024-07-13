import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;
  const LogoutButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: MyButtonStyles.logoutButtonStyle,
        onPressed: onPressed,
        child: const Text("登出本帳號"));
  }
}
