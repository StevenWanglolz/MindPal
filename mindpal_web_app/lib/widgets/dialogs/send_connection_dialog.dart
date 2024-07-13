import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';

class SendConnectionDialog extends StatefulWidget {
  const SendConnectionDialog({super.key});

  @override
  State<SendConnectionDialog> createState() => _SendConnectionDialogState();
}

class _SendConnectionDialogState extends State<SendConnectionDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: UIColors.apricot1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        "與諮商師建立連結",
        style: TextStyle(
            color: UIColors.darkGreen,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      content: const SizedBox(
        width: 300,
        height: 115,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            "您的合作請求已送出﹐待諮商師回覆後，系統會為您安排最適合的人選，並以Email通知您合作結果。\n\n謝謝您的耐心等待。",
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ))),
          ],
        ),
      ),
      // actions: [
      //   ElevatedButton(
      //       style: MyButtonStyles.confirmDialogButtonStyle,
      //       onPressed: () {
      //         Navigator.pushNamedAndRemoveUntil(
      //             context, Routes.baseView, (route) => false);
      //       },
      //       child: const Text("關閉")),
      // ],
    );
  }
}
