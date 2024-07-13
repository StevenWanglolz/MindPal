import 'package:flutter/material.dart';
import 'package:mindpal_flutter_app/constants/ui_colors.dart';

class MyButtonStyles {
  static ButtonStyle firstViewButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: UIColors.lightGreen,
    foregroundColor: UIColors.white,
    splashFactory: NoSplash.splashFactory, // 完全取消水波紋效果
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold
    )
  );

  static ButtonStyle nextStepButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: UIColors.lightGreen,
    foregroundColor: UIColors.white,
    splashFactory: NoSplash.splashFactory, // 完全取消水波紋效果
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    ),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold
    )
  );  

  static ButtonStyle cancelDialogButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: UIColors.grey4,
    foregroundColor: UIColors.white,
    splashFactory: NoSplash.splashFactory, // 完全取消水波紋效果
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    ),
    elevation: 0,
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold
    )
  );  

  static ButtonStyle forgetPasswordButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: UIColors.lightGreen,
    backgroundColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory, // 完全取消水波紋效果
    elevation: 0,
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold
    )
  );

  static ButtonStyle moodDiaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: UIColors.lightGreen,
    foregroundColor: UIColors.white,
    splashFactory: NoSplash.splashFactory, // 完全取消水波紋效果
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold
    )
  );

  static ButtonStyle confirmDialogButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: UIColors.lightGreen,
    foregroundColor: UIColors.white,
    splashFactory: NoSplash.splashFactory, // 完全取消水波紋效果
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold
    )
  );  

  static ButtonStyle newConsultButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: UIColors.lightGreen,
    foregroundColor: UIColors.white,
    splashFactory: NoSplash.splashFactory, // 完全取消水波紋效果
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold
    )
  );

  static ButtonStyle logoutButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: UIColors.lightGreen,
      foregroundColor: UIColors.white,
      splashFactory: NoSplash.splashFactory, // 完全取消水波紋效果
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),      
  );

  static ButtonStyle editProfileButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: UIColors.lightGreen,
      foregroundColor: UIColors.white,
      splashFactory: NoSplash.splashFactory, // 完全取消水波紋效果
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),      
  );  

  static ButtonStyle addTodayMoodDiaryButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: UIColors.lightGreen,
      foregroundColor: UIColors.white,
      splashFactory: NoSplash.splashFactory, // 完全取消水波紋效果
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),      
  );  

  static ButtonStyle profileButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: UIColors.apricot1,
      foregroundColor: UIColors.darkGreen,
      splashFactory: NoSplash.splashFactory, // 完全取消水波紋效果
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),      
  );
}

class MyTextStyles {
  static TextStyle hintTextStyle = const TextStyle(
    color: Color(0XFFBDBDBD),
    height: 1
  );

  static TextStyle appBarTextStyle = TextStyle(
    color: UIColors.darkGreen,
    fontWeight: FontWeight.bold,
    fontSize: 28
  );

  static TextStyle cardTitleTextStyle = TextStyle(
    color: UIColors.darkGreen,
    fontWeight: FontWeight.bold,
    fontSize: 18
  );
  static TextStyle cardTextButtonTextStyle = TextStyle(
    color: UIColors.lightGreen,
    fontSize: 12
  );

  static TextStyle lastestSummaryTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.normal
  ); 

  static TextStyle userInfoCardTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 10,
    fontWeight: FontWeight.normal
  ); 
  static TextStyle userNameTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold
  ); 
}

