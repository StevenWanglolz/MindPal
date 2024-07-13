import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/routes.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';
import 'package:mindpad_web_app/widgets/head_image_widgets.dart';

class UserInfoCard extends StatefulWidget {
  final String name;
  final int id;
  final String email;
  final DateTime joinDate;
  final bool emailVerified;

  const UserInfoCard(
      {super.key,
      required this.name,
      required this.id,
      required this.email,
      required this.joinDate,
      required this.emailVerified});

  @override
  State<UserInfoCard> createState() => _UserInfoCardState();
}

class _UserInfoCardState extends State<UserInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIColors.apricot1,
      child: Padding(
        padding: const EdgeInsets.only(left: 6, right: 6, top: 16, bottom: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Padding(
                    padding: EdgeInsets.only(left: 12, right: 8),
                    child: ProfileHeadContainer()),
                Text(
                  widget.name,
                  style: MyTextStyles.userNameTextStyle,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 75),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "User ID: ${widget.id}",
                    style: MyTextStyles.userInfoCardTextStyle,
                  ),
                  Text(
                    "Email: ${widget.email}",
                    style: MyTextStyles.userInfoCardTextStyle,
                  ),
                  Text(
                    "與MindPal的第一次互動: ${widget.joinDate}",
                    style: MyTextStyles.userInfoCardTextStyle,
                  ),
                  if (widget.emailVerified)
                    Text(
                      "Email驗證: 已驗證",
                      style:
                          TextStyle(color: UIColors.lightGreen, fontSize: 11),
                    ),
                  if (!widget.emailVerified)
                    const Text(
                      "Email驗證: 未驗證 #請先進行電子信箱驗證",
                      style: TextStyle(color: Colors.red, fontSize: 11),
                    ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => {
                          Navigator.pushNamed(context, Routes.editProfile,
                              arguments: {"id": widget.id})
                        },
                    child: Text(
                      "修改個人基本資訊",
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
