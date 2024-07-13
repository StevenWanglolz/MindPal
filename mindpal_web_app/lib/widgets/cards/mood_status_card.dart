import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/routes.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';
import 'package:mindpad_web_app/tools/global.dart';

class MoodStatusCard extends StatefulWidget {
  const MoodStatusCard({super.key});

  @override
  State<MoodStatusCard> createState() => _MoodStatusCardState();
}

class _MoodStatusCardState extends State<MoodStatusCard> {
  double moodRate = 0;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    String loginToken = await getLoginToken();
    Map<String, dynamic> response = await userService.user_get_info(loginToken);
    switch (response["status_code"]) {
      case 200:
        setUserInfoToDatabase(response);
        setState(() {
          moodRate = response["response"]["user_info"]["user_emotion_rate"];
        });
        break;
      case 401:
        logout();
        if (mounted) {
          navToFirstView(context);
          showMindPalHintDialog("${response["response"]["detail"]}", context);
        }
        break;
      case -1:
        if (mounted) showMindPalHintDialog("尚未連接網路，請稍後再試", context);
      default:
        if (mounted) {
          showMindPalHintDialog("伺服器錯誤，請稍後再試", context);
        }
        break;
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIColors.apricot1,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "心理狀態光譜",
                  style: MyTextStyles.cardTitleTextStyle,
                ),
                TextButton(
                    onPressed: () =>
                        {Navigator.pushNamed(context, Routes.weeklyMoodStatus)},
                    child: Text(
                      "查看更多",
                      style: MyTextStyles.cardTextButtonTextStyle,
                    ))
              ],
            ),
            if (moodRate == -1)
              const Text("目前暫無資料, 快去使用AI諮商或新增情緒日誌吧！")
            else if (moodRate == 0)
              const Text("")
            else if (moodRate != -1)
              ProgressIndicatorWidget(progress: moodRate)
          ],
        ),
      ),
    );
  }

  void navToFirstView(BuildContext context) {}
}

class ProgressIndicatorWidget extends StatelessWidget {
  final double progress; // 進度值，0.0 到 1.0
  const ProgressIndicatorWidget({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 40,
                width: 360,
                decoration: BoxDecoration(
                  color: UIColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                height: 40,
                width: 360 * progress, // 基於最大寬度乘以進度計算實際寬度
                decoration: BoxDecoration(
                  color: UIColors.lightGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('低落', style: TextStyle(color: Colors.black, fontSize: 14)),
              Text('良好', style: TextStyle(color: Colors.black, fontSize: 14)),
            ],
          )
        ],
      ),
    );
  }
}
