import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mindpad_web_app/constants/routes.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';
import 'package:mindpad_web_app/tools/global.dart';

class LatestSummaryCard extends StatefulWidget {
  const LatestSummaryCard({super.key});

  @override
  State<LatestSummaryCard> createState() => _LatestSummaryCardState();
}

class _LatestSummaryCardState extends State<LatestSummaryCard> {
  String consultLogDateString = "";
  String consultTitle = "預設諮商主題";
  String consultSummary = "";
  bool hasData = false;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // try to catch State error
    try {
      await appDb.getLatestChat();
    } catch (e) {
      setState(() {
        hasData = false;
      });
      print(e);
      return;
    }
    final value = await appDb.getLatestChat();
    DateFormat formatter = DateFormat("yyyy-MM-dd HH:mm");
    setState(() {
      consultLogDateString = formatter.format(value.chatStartDate);
      consultTitle = "預設諮商主題";
      consultSummary = jsonDecode(value.chatSummary)["summary"];
      hasData = true;
    });
  }

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
                  "最近一次諮商紀錄",
                  style: MyTextStyles.cardTitleTextStyle,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.consultLog,
                      );
                    },
                    child: Text(
                      "查看更多",
                      style: MyTextStyles.cardTextButtonTextStyle,
                    ))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            if (hasData)
              Flexible(
                child: Text(
                  "諮商日期：$consultLogDateString\n諮商主題：$consultTitle\n諮商摘要：\n$consultSummary",
                  style: MyTextStyles.lastestSummaryTextStyle,
                ),
              )
            else
              const Center(
                child: Text("目前暫無資料，快去使用AI諮商吧！"),
              )
          ],
        ),
      ),
    );
  }
}
