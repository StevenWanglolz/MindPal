import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/routes.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';

class MoodDiaryCard extends StatefulWidget {
  final int id;
  final String title;
  const MoodDiaryCard({super.key, required this.title, required this.id});

  @override
  State<MoodDiaryCard> createState() => _MoodDiaryCardState();
}

class _MoodDiaryCardState extends State<MoodDiaryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIColors.apricot1,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(
                  widget.title,
                  style: MyTextStyles.cardTitleTextStyle,
                )),
                TextButton(
                    onPressed: () => {
                          Navigator.pushNamed(
                            context,
                            Routes.editMoodDiary,
                            arguments: {'id': widget.id, 'title': widget.title},
                          )
                        },
                    child: Text(
                      "查看更多",
                      style: MyTextStyles.cardTextButtonTextStyle,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
