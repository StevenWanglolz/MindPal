import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mindpad_web_app/data/db/app_db.dart';
import 'package:mindpad_web_app/services/chat_service.dart';
import 'package:mindpad_web_app/services/connection_service.dart';
import 'package:mindpad_web_app/services/diary_service.dart';
import 'package:mindpad_web_app/services/login_service.dart';
import 'package:mindpad_web_app/services/therapist_service.dart';
import 'package:mindpad_web_app/services/user_service.dart';
import 'package:mindpad_web_app/widgets/dialogs/hint_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drift/drift.dart' as drift;

AppDb appDb = AppDb();
LoginService loginService = LoginService();
UserService userService = UserService();
ChatService chatService = ChatService();
DiaryService diaryService = DiaryService();
TherapistService therapistService = TherapistService();
ConnectionService connectionService = ConnectionService();

void showMindPalHintDialog(String message, BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return HintDialog(message: message);
      });
}

Future<void> logout() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await _removeUserInfoFromDatabase(preferences);
  await _removeLoginTokenFromSharedPreferences(preferences);
  await _removeUserIDFromSharedPreferences(preferences);
}

Future<void> _removeUserInfoFromDatabase(SharedPreferences preferences) async {
  final int? id = preferences.getInt("userID");
  if (id != null) {
    await appDb.deleteUserEntity(id);
  }
}

Future<void> _removeLoginTokenFromSharedPreferences(
    SharedPreferences preferences) async {
  preferences.remove("loginToken");
}

Future<void> _removeUserIDFromSharedPreferences(
    SharedPreferences preferences) async {
  preferences.remove("userID");
}

// void navToFirstView(BuildContext context) {
//   Navigator.pushNamedAndRemoveUntil(context, Routes.first, (route) => false);
// }

// void navToBaseView(BuildContext context) {
//   Navigator.pushNamedAndRemoveUntil(context, Routes.baseView, (route) => false);
// }

// void navToTherapistListView(BuildContext context) {
//   Navigator.pushNamed(context, Routes.therapistList);
// }

Future<void> setUserInfoToDatabase(Map<String, dynamic> response) async {
  appDb.deleteAllUsers();
  DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSSZ");
  final entity = UserEntityCompanion(
      id: drift.Value(response["response"]["user_info"]["user_id"]),
      email: drift.Value(response["response"]["user_info"]["user_email"]),
      name: drift.Value(response["response"]["user_info"]["user_name"]),
      phone: drift.Value(response["response"]["user_info"]["user_phone"]),
      gender: drift.Value(response["response"]["user_info"]["user_gender"]),
      emergencyContact: drift.Value(
          response["response"]["user_info"]["user_emergency_contact"]),
      emergencyContactEmail: drift.Value(
          response["response"]["user_info"]["user_emergency_contact_email"]),
      emergencyContactPhone: drift.Value(
          response["response"]["user_info"]["user_emergency_contact_phone"]),
      joinDate: drift.Value(dateFormat
          .parse(response["response"]["user_info"]["user_join_date"])),
      verified: drift.Value(response["response"]["user_info"]["user_verified"]),
      emotionRate:
          drift.Value(response["response"]["user_info"]["user_emotion_rate"]));
  appDb.insertUserEntity(entity);
}

Future<void> setTherapistToDatabase(List entityList) async {
  if (entityList.isEmpty) {
    return;
  }
  await appDb.deleteAllTherapists();
  DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSSZ");
  for (int i = 0; i < entityList.length; i++) {
    TherapistEntityCompanion entity = TherapistEntityCompanion(
      id: drift.Value<int>(entityList[i]["therapist_id"]),
      name: drift.Value(entityList[i]["therapist_name"]),
      email: drift.Value(entityList[i]["therapist_email"]),
      phone: drift.Value(entityList[i]["therapist_phone"]),
      gender: drift.Value(entityList[i]["therapist_gender"]),
      joinDate:
          drift.Value(dateFormat.parse(entityList[i]["therapist_join_date"])),
      info: drift.Value(entityList[i]["therapist_info"]),
      specialty: drift.Value(jsonEncode(entityList[i]["therapist_specialty"])),
      connectionAmount:
          drift.Value(entityList[i]["therapist_connection_amount"]),
      verifiedEmail: drift.Value(entityList[i]["therapist_verified_email"]),
      verifiedCert: drift.Value(entityList[i]["therapist_verified_cert"]),
    );
    appDb.insertTherapistEntity(entity);
  }
}

Future<void> setChatToDatabase(List chatList) async {
  await appDb.deleteAllChats();
  DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSSZ");
  for (int i = 0; i < chatList.length; i++) {
    ChatEntityCompanion entity = ChatEntityCompanion(
      id: drift.Value<int>(chatList[i]["chat_id"]),
      chatContent: drift.Value(jsonEncode(chatList[i]["chat_content"])),
      chatStartDate: drift.Value(
        dateFormat.parse(chatList[i]["chat_start_date"]),
      ),
      chatEndDate: drift.Value(chatList[i]["chat_end_date"] == null
          ? null
          : dateFormat.parse(chatList[i]["chat_end_date"])),
      chatProcessing: drift.Value(chatList[i]["chat_processing"]),
      chatSummary: drift.Value(jsonEncode(chatList[i]["chat_summary"])),
      chatToken: drift.Value(chatList[i]["chat_token"]),
    );
    await appDb.insertChatEntity(entity);
  }
}

Future<void> updateUserInAppDb(
  int userID,
  String name,
  String phone,
  int gender,
  String emergencyContactName,
  String emergencyContactEmail,
  String emergencyContactPhone,
) async {
  appDb.getUser(userID).then((value) {
    final entity = UserEntityCompanion(
        id: drift.Value(userID),
        name: drift.Value(name),
        phone: drift.Value(phone),
        email: drift.Value(value.email),
        gender: drift.Value(gender),
        emergencyContact: drift.Value(emergencyContactName),
        emergencyContactEmail: drift.Value(emergencyContactEmail),
        emergencyContactPhone: drift.Value(emergencyContactPhone),
        joinDate: drift.Value(value.joinDate),
        verified: drift.Value(value.verified),
        emotionRate: drift.Value(value.emotionRate));
    appDb.updateUserEntity(entity);
  });
}

Future<String> getLoginToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString("loginToken") ?? "";
}

Future<int> getLoginUserID() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getInt("userID") ?? -1;
}

Future<void> setLoginTokenToSharedPreferences(String loginToken) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString("loginToken", loginToken);
}

Future<void> setUserIDToSharedPreferences(int userID) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt("userID", userID);
}

bool checkPhoneIsValid(String phone) {
  if (!RegExp(r"09\d{8}").hasMatch(phone) || phone.length != 10) {
    return false;
  }
  return true;
}

bool checkEmailIsValid(String email) {
  if (!RegExp(
          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
      .hasMatch(email)) {
    return false;
  }
  return true;
}

bool checkNameIsValid(String name) {
  if (!RegExp(r"^[\u4e00-\u9fa5a-zA-Z]+$").hasMatch(name) ||
      name.contains(" ")) {
    return false;
  }
  return true;
}

bool checkPasswordIsValid(String password) {
  if (password.length < 8 || !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(password)) {
    return false;
  }
  return true;
}

String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
