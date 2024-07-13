import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

class DiaryService {
  Future<Map<String, dynamic>> getDiaries(String loginToken) async {
    var url = Uri.parse("https://api.mindpal.life/diaries/$loginToken");
    try {
      var response = await http.get(url);
      if (response.statusCode == 500 || response.statusCode == 502) {
        return {"status_code": response.statusCode};
      }
      final decodedData = utf8.decode(response.bodyBytes);
      if (response.statusCode != 200) {
        final Map<String, dynamic> decodedMapData = json.decode(decodedData);
        return {"status_code": response.statusCode, "response": decodedMapData};
      }
      final List<dynamic> decodedMapData = json.decode(decodedData);
      print(decodedMapData);
      return {"status_code": response.statusCode, "response": decodedMapData};
    } catch (e) {
      if (e is SocketException) {
        // Handle the SocketException here
        print("SocketException: ${e.message}");
        return {"status_code": -1, "error": e.message};
      } else {
        // Handle other exceptions here
        print("Unknown exception: $e");
        return {"status_code": -1, "error": "Unknown error"};
      }
    }
  }

  Future<Map<String, dynamic>> createDiary(
      String loginToken, int mood, List event, String content) async {
    var url = Uri.parse("https://api.mindpal.life/diary");
    try {
      var requestBody = jsonEncode({
        "token": loginToken,
        "diary_mood": mood.toString(),
        "diary_event": event,
        "diary_content": content
      });
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: requestBody);
      if (response.statusCode == 500 || response.statusCode == 502) {
        return {"status_code": response.statusCode};
      }
      final decodedData = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> decodedMapData = json.decode(decodedData);
      return {"status_code": response.statusCode, "response": decodedMapData};
    } catch (e) {
      if (e is SocketException) {
        // Handle the SocketException here
        print("SocketException: ${e.message}");
        return {"status_code": -1, "error": e.message};
      } else {
        // Handle other exceptions here
        print("Unknown exception: $e");
        return {"status_code": -1, "error": "Unknown error"};
      }
    }
  }

  Future<Map<String, dynamic>> updateDiary(String loginToken, int diaryId,
      int mood, List event, String content) async {
    var url = Uri.parse("https://api.mindpal.life/diary");
    try {
      var requestBody = jsonEncode({
        "token": loginToken,
        "diary_id": diaryId,
        "diary_mood": mood.toString(),
        "diary_events": event,
        "diary_content": content
      });
      var response = await http.put(url,
          headers: {"Content-Type": "application/json"}, body: requestBody);
      if (response.statusCode == 500 || response.statusCode == 502) {
        return {"status_code": response.statusCode};
      }
      final decodedData = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> decodedMapData = json.decode(decodedData);
      print(decodedMapData);
      return {"status_code": response.statusCode, "response": decodedMapData};
    } catch (e) {
      if (e is SocketException) {
        // Handle the SocketException here
        print("SocketException: ${e.message}");
        return {"status_code": -1, "error": e.message};
      } else {
        // Handle other exceptions here
        print("Unknown exception: $e");
        return {"status_code": -1, "error": "Unknown error"};
      }
    }
  }
}
