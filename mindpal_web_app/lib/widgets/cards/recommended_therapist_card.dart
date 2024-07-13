import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';

class RecommendedTherapistCard extends StatefulWidget {
  const RecommendedTherapistCard({super.key});

  @override
  State<RecommendedTherapistCard> createState() =>
      _RecommendedTherapistCardState();
}

class _RecommendedTherapistCardState extends State<RecommendedTherapistCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIColors.apricot1,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "推薦諮商師",
                  style: MyTextStyles.cardTitleTextStyle,
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 88,
                          height: 41,
                          child: ElevatedButton(
                            style: MyButtonStyles.confirmDialogButtonStyle,
                            onPressed: () => {},
                            child: const Icon(Icons.refresh),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
