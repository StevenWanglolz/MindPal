import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';

class TodayEventCard extends StatefulWidget {
  final List<dynamic> selectedIndices;
  const TodayEventCard({super.key, required this.selectedIndices});

  @override
  State<TodayEventCard> createState() => TodayEventCardState();
}

class TodayEventCardState extends State<TodayEventCard> {
  final List<dynamic> _selectedIndices = []; // 更新成一個列表，用於追蹤多個選擇
  List<String> events = [
    "瑜珈",
    "冥想",
    "重訓",
    "慢跑",
    "閱讀",
    "聽音樂",
    "下廚",
    "打遊戲",
    "打球"
  ];
  List<dynamic> getSelectedIndices() {
    return _selectedIndices;
  }

  @override
  void initState() {
    super.initState();
    _selectedIndices.addAll(widget.selectedIndices);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIColors.apricot1,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "今天做了什麼活動...",
                  style: MyTextStyles.cardTitleTextStyle,
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
                height: 130,
                width: 320,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: events.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3.5,
                  ),
                  itemBuilder: (context, index) {
                    bool isSelected =
                        _selectedIndices.contains(events[index]); // 檢查當前索引是否被選中
                    return EventOptionsWidget(
                      eventName: events[index],
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedIndices.remove(events[index]); // 如果已選中，則移除
                          } else {
                            _selectedIndices.add(events[index]); // 如果未選中，則添加
                          }
                        });
                      },
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}

class EventOptionsWidget extends StatelessWidget {
  final String eventName;
  final bool isSelected;
  final VoidCallback onTap;
  const EventOptionsWidget(
      {super.key,
      required this.eventName,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: isSelected ? UIColors.lightGreen : UIColors.grey1,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(eventName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
