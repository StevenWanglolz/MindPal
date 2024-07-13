import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';

class TodayMoodDiaryCard extends StatefulWidget {
  final String content;
  const TodayMoodDiaryCard({super.key, required this.content});

  @override
  State<TodayMoodDiaryCard> createState() => TodayMoodDiaryCardState();
}

class TodayMoodDiaryCardState extends State<TodayMoodDiaryCard> {
  final TextEditingController _textController = TextEditingController();
  String getContent() {
    return _textController.text;
  }

  @override
  void initState() {
    super.initState();
    _textController.text = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIColors.apricot1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "寫下您今天的心情",
                  style: MyTextStyles.cardTitleTextStyle,
                )
              ],
            ),
            const SizedBox(height: 10), // 加入一點間隔
            TextField(
              maxLines: 5, // 允許多行輸入
              controller: _textController,
              decoration: InputDecoration(
                hintText: "輸入你的心情日記...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
