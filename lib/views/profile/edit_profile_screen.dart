import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:tripify_app/functions/function_post.dart';
import 'package:tripify_app/functions/navigation_services.dart';
import 'package:tripify_app/views/home/section_profile.dart';

import '../../customs/button_custom.dart';
import '../../functions/function_get.dart';
import '../../functions/token_manager.dart';
import '../../model/user.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

UserData? _user;

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _profileImageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      String? token = await TokenManager.getToken();
      http.Response response = await getUserData(token);

      final user = UserData.fromJson(json.decode(response.body));

      _user = user;
      setState(() {});
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> _updateUserData(String fullname, String email, String address,
      String country, String phone) async {
    try {
      Map<String, String> data = {
        'fullname': fullname,
        'email': email,
        'address': address,
        'country': country,
        'phone': phone
      };

      String? token = await TokenManager.getToken();

      http.Response response = await updateProfile(data, token);
      if (response.statusCode == 200) {
        await NavigationServices.pushReplacement(const SectionProfile());
      }
    } catch (e) {
      print('Error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004C5C).withOpacity(0.5),
        title: Text(
          'Edit Profile',
          style: GoogleFonts.poppins(
              fontSize: 30 * width / 720,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.16,
              height: MediaQuery.of(context).size.width * 0.16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey, // Warna border
                  width: 3, // Lebar border
                ),
              ),
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.08,
                backgroundImage: NetworkImage('${_user?.profile.profileImage}'),
              ),
            ),
            SizedBox(height: 0.01 * height),
            TextFormField(
              controller: _usernameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Full Name',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _addressController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Address',
                prefixIcon: const Icon(Icons.location_city),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _countryController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Country',
                prefixIcon: const Icon(Icons.location_on),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your country';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Phone',
                prefixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone';
                }
                return null;
              },
            ),
            SizedBox(height: 0.01 * height),
            ButtonCustom(
                text: 'Submit',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _updateUserData(
                        _usernameController.text,
                        _emailController.text,
                        _addressController.text,
                        _countryController.text,
                        _phoneController.text);
                  }
                }),
          ]
              .map((widget) => Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 15.0, right: 15.0),
                    child: widget,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
