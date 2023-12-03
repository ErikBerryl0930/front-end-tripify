import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tripify_app/functions/api_url.dart';
import 'package:tripify_app/model/category.dart';

Future<http.Response> getUserData(String token) async {
  var response = await http.get(
    Uri.parse('${ApiUrl.apiURL}/users/account'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    },
  );
  return response;
}

Future<List<Category>> getCategories() async {
  var response = await http.get(Uri.parse('${ApiUrl.apiURL}/categories'));

  print(response.body);
  if (response.statusCode == 200) {
    try {
      List<dynamic> data = json.decode(response.body);
      List<Category> fetchedCategories =
          data.map((category) => Category.fromJson(category)).toList();

      return fetchedCategories;
    } catch (e) {
      print('Error parsing JSON: $e');
      // Handle the error, return an empty list or throw an exception as needed
      return [];
    }
  } else {
    // If the server did not return a 200 OK response, print the response status
    print('Failed to load categories. Status code: ${response.statusCode}');
    // Handle the error, return an empty list or throw an exception as needed
    return [];
  }
}
