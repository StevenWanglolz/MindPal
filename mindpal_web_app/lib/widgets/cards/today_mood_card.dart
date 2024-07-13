import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';
import 'package:mindpad_web_app/widgets/head_image_widgets.dart';

class TodayMoodCard extends StatefulWidget {
  final int selectedIndex;
  const TodayMoodCard({super.key, required this.selectedIndex});

  @override
  State<TodayMoodCard> createState() => TodayMoodCardState();
}

class TodayMoodCardState extends State<TodayMoodCard> {
  int _selectedIndex = -1; // 初始狀態，沒有容器被選中

  int getSelectedIndex() {
    return _selectedIndex;
  }

  void setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIColors.apricot1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "今天的心情",
                  style: MyTextStyles.cardTitleTextStyle,
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setSelectedIndex(0);
                  },
                  child: BadMoodContainer(
                    index: 0,
                    isSelected: _selectedIndex == 0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setSelectedIndex(1);
                  },
                  child: NormalMoodContainer(
                    index: 1,
                    isSelected: _selectedIndex == 1,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setSelectedIndex(2);
                  },
                  child: SmileMoodContainer(
                    index: 2,
                    isSelected: _selectedIndex == 2,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setSelectedIndex(3);
                  },
                  child: HappyMoodContainer(
                    index: 3,
                    isSelected: _selectedIndex == 3,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
