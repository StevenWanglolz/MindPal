import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';
import 'package:mindpad_web_app/widgets/dialogs/create_connection_dialog.dart';
import 'package:mindpad_web_app/widgets/head_image_widgets.dart';

class TherapistInfoDialog extends StatefulWidget {
  final String name;
  final String specialty;
  final String info;
  const TherapistInfoDialog(
      {super.key,
      required this.name,
      required this.specialty,
      required this.info});

  @override
  State<TherapistInfoDialog> createState() => _TherapistInfoDialogState();
}

class _TherapistInfoDialogState extends State<TherapistInfoDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: UIColors.apricot1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: SizedBox(
        width: 300,
        height: 270,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  const ProfileHeadContainer(),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "${widget.name} 諮商師",
                    style: MyTextStyles.userNameTextStyle,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 14),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "專長領域: ${widget.specialty}\n自我介紹:\n${widget.info}",
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
      actions: [
        ElevatedButton(
            style: MyButtonStyles.confirmDialogButtonStyle,
            onPressed: () {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CreateConnectionDialog(
                      name: widget.name,
                    );
                  });
            },
            child: const Text("建立連結")),
        ElevatedButton(
            style: MyButtonStyles.confirmDialogButtonStyle,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("關閉"))
      ],
    );
  }
}
