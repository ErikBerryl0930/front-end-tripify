import 'dart:convert'; // Import for json.decode
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const String _tokenKey = 'user_token';

  // Step 1: Extract Token from JSON Response
  static String? extractTokenFromResponse(String jsonResponse) {
    try {
      Map<String, dynamic> parsedJson = json.decode(jsonResponse);
      print(parsedJson['barier_token']);
      return parsedJson['barier_token'];
    } catch (e) {
      print('Error extracting token: $e');
      return null;
    }
  }

  // Step 2: Store Token in SharedPreferences
  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }
}
