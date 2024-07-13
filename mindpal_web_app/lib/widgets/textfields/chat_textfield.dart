import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({super.key});

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
          color: UIColors.grey1,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: UIColors.grey2)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Message here...",
                  hintStyle: TextStyle(color: UIColors.grey4),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 14, bottom: 2)),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: UIColors.lightGreen,
                shape: BoxShape.circle // 設置背景顏色 // 如果需要圓角
                ),
            child: IconButton(
              icon: const Icon(Icons.mic),
              color: Colors.white, // 設置圖標顏色
              onPressed: () {
                // 執行的動作
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: UIColors.lightGreen, // 設置背景顏色
                shape: BoxShape.circle // 如果需要圓角
                ),
            child: IconButton(
              icon: const Icon(Icons.arrow_upward),
              color: Colors.white, // 設置圖標顏色
              onPressed: () {
                // 執行的動作
              },
            ),
          ),
        ],
      ),
    );
  }
}
