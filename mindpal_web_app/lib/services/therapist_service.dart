import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

class TherapistService {
  Future<Map<String, dynamic>> userGetAllTherapists(String loginToken) async {
    var url = Uri.parse("https://api.mindpal.life/user/therapists/$loginToken");

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

  Future<Map<String, dynamic>> createTherapist(String name, String phone,
      String email, String password, String salt) async {
    var url = Uri.parse("https://api.mindpal.life/user");
    var requestBody = jsonEncode({
      "name": name,
      "phone": phone,
      "email": email,
      "hashed_password": password,
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
}
