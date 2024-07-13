import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatService {
  Future<Map<String, dynamic>> getChats(String loginToken) async {
    var url = Uri.parse("https://api.mindpal.life/user/chats/$loginToken");
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
      print("getChats: \n");
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

  Future<Map<String, dynamic>> createChat(String loginToken) async {
    var url = Uri.parse("https://api.mindpal.life/chat/new");
    try {
      var requestBody = jsonEncode({
        "login_token": loginToken,
      });
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: requestBody);
      if (response.statusCode == 500 || response.statusCode == 502) {
        return {"status_code": response.statusCode};
      }
      final decodedData = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> decodedMapData = json.decode(decodedData);
      print("createChat: \n");
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

  Future<Map<String, dynamic>> endChat(String loginToken) async {
    var url = Uri.parse("https://api.mindpal.life/chat/end");
    try {
      var requestBody = jsonEncode({
        "login_token": loginToken,
      });
      var response = await http.put(url,
          headers: {"Content-Type": "application/json"}, body: requestBody);
      if (response.statusCode == 500 || response.statusCode == 502) {
        return {"status_code": response.statusCode};
      }
      final decodedData = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> decodedMapData = json.decode(decodedData);
      print("endChat: \n");
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

  Future<Map<String, dynamic>> sendMessage(
      String loginToken, String message) async {
    var url = Uri.parse("https://api.mindpal.life/chat");
    try {
      var requestBody = jsonEncode({
        "login_token": loginToken,
        "message": message,
      });
      var response = await http.put(url,
          headers: {"Content-Type": "application/json"}, body: requestBody);
      if (response.statusCode == 500 || response.statusCode == 502) {
        return {"status_code": response.statusCode};
      }
      final decodedData = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> decodedMapData = json.decode(decodedData);
      print("sendMessage: \n");
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
