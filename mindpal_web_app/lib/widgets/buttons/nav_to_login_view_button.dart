import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/routes.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';

class NavToLoginViewButton extends StatelessWidget {
  const NavToLoginViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: MyButtonStyles.firstViewButtonStyle,
        onPressed: () => _navigate(context),
        child: const Text("登入"));
  }

  Future<void> _navigate(BuildContext context) async {
    Navigator.pushNamed(context, Routes.login);
  }
}
