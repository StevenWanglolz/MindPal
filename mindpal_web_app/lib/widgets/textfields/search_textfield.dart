import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: '搜尋...',
        filled: true,
        fillColor: UIColors.grey1, // 背景色為白色
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 20), // 內邊距
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30), // 圓角設定
            borderSide: BorderSide(color: UIColors.grey3, width: 1) // 無邊框
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: UIColors.grey3, width: 1), // 啟用狀態下的邊框樣式
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:
              BorderSide(color: UIColors.lightGreen, width: 2), // 聚焦狀態下的邊框樣式
        ),
      ),
    );
  }
}
