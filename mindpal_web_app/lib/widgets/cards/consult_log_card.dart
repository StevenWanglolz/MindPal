import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/routes.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';

class ConsultLogCard extends StatelessWidget {
  final String consultLogDateString;
  final String consultTitle;
  final String consultSummary;
  final int chatID;
  const ConsultLogCard(
      {super.key,
      required this.chatID,
      required this.consultLogDateString,
      required this.consultTitle,
      required this.consultSummary});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIColors.apricot1,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  consultLogDateString.substring(0, 10),
                  style: MyTextStyles.cardTitleTextStyle,
                ),
                TextButton(
                    onPressed: () {
                      print("chatID: $chatID");
                      Navigator.pushNamed(context, Routes.consultLogDetail,
                          arguments: {"id": chatID});
                    },
                    child: Text(
                      "查看諮商紀錄",
                      style: MyTextStyles.cardTextButtonTextStyle,
                    ))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Flexible(
              child: Text(
                "諮商日期：$consultLogDateString\n諮商主題：$consultTitle\n諮商摘要：\n${jsonDecode(consultSummary)["summary"]}",
                style: MyTextStyles.lastestSummaryTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
