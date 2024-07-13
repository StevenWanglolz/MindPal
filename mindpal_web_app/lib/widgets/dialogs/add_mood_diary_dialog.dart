import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';

class AddMoodDiaryDialog extends StatefulWidget {
  const AddMoodDiaryDialog({super.key});

  @override
  State<AddMoodDiaryDialog> createState() => _AddMoodDiaryDialogState();
}

class _AddMoodDiaryDialogState extends State<AddMoodDiaryDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: UIColors.apricot1,
      content: const SizedBox(
        width: 300,
        height: 100,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(
            "新增成功！",
            style: TextStyle(fontSize: 16),
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
