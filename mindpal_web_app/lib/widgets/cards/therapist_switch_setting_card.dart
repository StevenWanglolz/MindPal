import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';

class TherapistSwitchSettingCard extends StatefulWidget {
  const TherapistSwitchSettingCard({super.key});

  @override
  State<TherapistSwitchSettingCard> createState() =>
      _TherapistSwitchSettingCardState();
}

class _TherapistSwitchSettingCardState
    extends State<TherapistSwitchSettingCard> {
  bool _isSettingOpen = false;
  final WidgetStateProperty<Icon?> thumbIcon =
      WidgetStateProperty.resolveWith<Icon?>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIColors.apricot1,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 0, top: 12, bottom: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "諮商師權限",
                  style: MyTextStyles.cardTitleTextStyle,
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "諮商師查看完整AI諮商紀錄權限",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  width: 100,
                  height: 36,
                  child: Switch(
                    thumbIcon: thumbIcon,
                    value: _isSettingOpen,
                    onChanged: (value) => {
                      setState(() {
                        _isSettingOpen = value;
                      })
                    },
                    activeTrackColor: UIColors.lightGreen,
                    inactiveThumbColor: UIColors.grey4,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
