import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  Future<Map<String, dynamic>> user_get_info(String loginToken) async {
    var url = Uri.parse("https://api.mindpal.life/user/$loginToken");
    try {
      var response = await http.get(url);
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

  Future<Map<String, dynamic>> createUser(
      String name,
      String phone,
      String email,
      String password,
      int gender,
      String emergencyContactName,
      String emergencyContactEmail,
      String emergencyContactPhone,
      String salt) async {
    var url = Uri.parse("https://api.mindpal.life/user");
    var requestBody = jsonEncode({
      "name": name,
      "phone": phone,
      "email": email,
      "hashed_password": password,
      "gender": gender.toString(),
      "emergency_contact": emergencyContactName,
      "emergency_contact_email": emergencyContactEmail,
      "emergency_contact_phone": emergencyContactPhone,
      "salt": salt
    });
    try {
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: requestBody);
      if (response.statusCode == 502 || response.statusCode == 500) {
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

  Future<Map<String, dynamic>> updateUser(
      String token,
      String name,
      String phone,
      int gender,
      String emergencyContactName,
      String emergencyContactEmail,
      String emergencyContactPhone) async {
    var url = Uri.parse("https://api.mindpal.life/user");
    var requestBody = jsonEncode({
      "token": token,
      "name": name,
      "phone": phone,
      "gender": gender.toString(),
      "emergency_contact": emergencyContactName,
      "emergency_contact_email": emergencyContactEmail,
      "emergency_contact_phone": emergencyContactPhone
    });
    try {
      var response = await http.put(url,
          headers: {"Content-Type": "application/json"}, body: requestBody);
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

  Future<Map<String, dynamic>> sendForgetPasswordEmail(String email) async {
    var url = Uri.parse("https://api.mindpal.life/user/forget");
    var requestBody = jsonEncode({"email": email});
    try {
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

  Future<Map<String, dynamic>> verifyCertCode(
      String processToken, String code) async {
    var url = Uri.parse("https://api.mindpal.life/user/forget/verify");
    var requestBody =
        jsonEncode({"token": processToken, "verification_code": code});
    try {
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

  Future<Map<String, dynamic>> resetPassword(
      String processToken, String newSalt, String newHashedPassword) async {
    var url = Uri.parse("https://api.mindpal.life/user/forget/reset");
    var requestBody = jsonEncode({
      "token": processToken,
      "new_salt": newSalt,
      "new_hashed_password": newHashedPassword
    });
    try {
      var response = await http.put(url,
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

  Future<Map<String, dynamic>> resendVerifyCode(String processToken) async {
    var url = Uri.parse("https://api.mindpal.life/user/forget/resend");
    var requestBody = jsonEncode({"token": processToken});
    try {
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
}
