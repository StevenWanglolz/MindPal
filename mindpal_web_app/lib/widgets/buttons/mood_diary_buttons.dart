import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';

class MoodDiaryDeleteButton extends StatelessWidget {
  const MoodDiaryDeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: MyButtonStyles.moodDiaryButtonStyle,
        onPressed: () => {},
        child: const Text("刪除"));
  }
}

class MoodDiaryEditButton extends StatelessWidget {
  const MoodDiaryEditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: MyButtonStyles.moodDiaryButtonStyle,
        onPressed: () => {},
        child: const Text("編輯"));
  }
}
