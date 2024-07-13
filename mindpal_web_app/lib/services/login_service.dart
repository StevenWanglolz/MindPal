import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService {
  //取得用戶鹽值
  Future<Map<String, dynamic>> getSalt(String email) async {
    var url = Uri.parse("https://api.mindpal.life/user/salt/$email");
    try {
      var response = await http.get(url);
      if (response.statusCode == 500 || response.statusCode == 502) {
        return {"status_code": response.statusCode};
      }
      final decodedData = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> decodedMapData = json.decode(decodedData);
      if (response.statusCode == 404) {
        return {"status_code": 404, "response": decodedMapData};
      }
      return {"status_code": 200, "response": decodedMapData};
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

  //用戶登入
  Future<Map<String, dynamic>> login(
      String email, String hashedPassword) async {
    var url = Uri.parse("https://api.mindpal.life/user/login");
    try {
      var requestBody = jsonEncode({
        "email": email,
        "hashed_password": hashedPassword,
      });
      var response = await http.post(url,
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
