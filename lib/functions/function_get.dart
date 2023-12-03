import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tripify_app/functions/api_url.dart';
import 'package:tripify_app/model/category.dart';
import 'package:tripify_app/model/user.dart';

import '../model/destination.dart';

Future<http.Response> getUserData(String? token) async {
  final response = await http.get(
    Uri.parse('${ApiUrl.apiURL}/users/account'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    // print(response.body);
    return response;
  } else {
    throw Exception('Failed to load user data');
  }
}

Future<List<Category>> getCategories() async {
  var response = await http.get(Uri.parse('${ApiUrl.apiURL}/categories/'));

  print("test");
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

// function get destinations
Future<List<Destination>> getDestinations() async {
  var response = await http.get(Uri.parse('${ApiUrl.apiURL}/destinations'));

  print(response.body);
  if (response.statusCode == 200) {
    try {
      List<dynamic> data = json.decode(response.body);
      List<Destination> fetchedCategories =
          data.map((destination) => Destination.fromJson(destination)).toList();

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

// function get destination info
Future<List<Destination>> getDestinationInfo() async {
  var response = await http.get(Uri.parse('${ApiUrl.apiURL}/destinations/information/'));

  print(response.body);
  if (response.statusCode == 200) {
    try {
      List<dynamic> data = json.decode(response.body);
      List<Destination> fetchedDestinationInfo =
          data.map((destination) => Destination.fromJson(destination)).toList();

      return fetchedDestinationInfo;
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
