import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';
import 'package:mindpad_web_app/widgets/dialogs/therapist_info_dialog.dart';
import 'package:mindpad_web_app/widgets/head_image_widgets.dart';

class TherapistListCard extends StatefulWidget {
  final String name;
  final String specialty;
  final String info;
  const TherapistListCard(
      {super.key,
      required this.name,
      required this.specialty,
      required this.info});

  @override
  State<TherapistListCard> createState() => _TherapistListCardState();
}

class _TherapistListCardState extends State<TherapistListCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIColors.apricot1,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        /*side: BorderSide(
          color: UIColors.apricot2
        )*/
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 0, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const ProfileHeadContainer(),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  "${widget.name}/${widget.specialty}",
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                    style: const ButtonStyle(
                        splashFactory: NoSplash.splashFactory),
                    onPressed: () => {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return TherapistInfoDialog(
                                  name: widget.name,
                                  specialty: widget.specialty,
                                  info: widget.info,
                                );
                              })
                        },
                    child: Text(
                      "查看詳細資訊",
                      style: MyTextStyles.cardTextButtonTextStyle,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
