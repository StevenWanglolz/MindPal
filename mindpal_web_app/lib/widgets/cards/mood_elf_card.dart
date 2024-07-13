import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';

class MoodElfCard extends StatefulWidget {
  const MoodElfCard({super.key});

  @override
  State<MoodElfCard> createState() => _MoodElfCardState();
}

class _MoodElfCardState extends State<MoodElfCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIColors.apricot1,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "情緒小精靈",
                  style: MyTextStyles.cardTitleTextStyle,
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                "你遠比你想象中的還要強大。",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
