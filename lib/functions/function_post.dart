import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tripify_app/functions/api_url.dart';

//function register
Future<http.Response> postApiRegister(Map<String, String> data) async {
  var response = await http.post(
    Uri.parse('${ApiUrl.apiURL}/users'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );
  return response;
}

//function login
Future<http.Response> postApiLogin(Map<String, String> data) async {
  var response = await http.post(
    Uri.parse('${ApiUrl.apiURL}/users/login'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );
  return response;
}