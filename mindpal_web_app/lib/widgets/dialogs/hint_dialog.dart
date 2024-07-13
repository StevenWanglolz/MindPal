import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';

class HintDialog extends StatelessWidget {
  final String message;
  const HintDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: UIColors.apricot1,
      content: SizedBox(
        width: 300,
        height: 100,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(
            message,
            style: const TextStyle(fontSize: 16),
          ),
        ]),
      ),
      actions: [
        ElevatedButton(
          style: MyButtonStyles.confirmDialogButtonStyle,
          onPressed: () => {Navigator.pop(context)},
          child: const Text("確認"),
        ),
      ],
    );
  }
}
