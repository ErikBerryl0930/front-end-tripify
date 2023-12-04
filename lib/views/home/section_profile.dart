import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripify_app/functions/navigation_services.dart';
import 'package:tripify_app/functions/token_manager.dart';
import 'package:http/http.dart' as http;
import 'package:tripify_app/model/user.dart';
import 'package:tripify_app/views/login/login_screen.dart';
import '../../functions/function_get.dart';

class SectionProfile extends StatefulWidget {
  const SectionProfile({super.key});

  @override
  State<SectionProfile> createState() => _SectionProfileState();
}

UserData? _user;

class _SectionProfileState extends State<SectionProfile> {
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

      setState(() {
        _user = user;
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> logout() async {
    await TokenManager.clearToken();
    // Add additional logout logic here, such as navigating to the login screen
    await NavigationServices.pushReplacement(const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
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
                      backgroundImage:
                          NetworkImage('${_user?.profile.profileImage}'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('${_user?.username}'),
                        Text('${_user?.email}')
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    Icon(Icons.person,
                        size: MediaQuery.of(context).size.width * 0.08),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Edit Profile'),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    Icon(Icons.settings,
                        size: MediaQuery.of(context).size.width * 0.08),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Settings'),
                    )
                  ],
                ),
              ),
              // GestureDetector(
              //   onTap: () {},
              //   child: Row(
              //     children: <Widget>[
              //       Icon(Icons.list_alt_rounded,
              //           size: MediaQuery.of(context).size.width * 0.08),
              //       const Padding(
              //         padding: EdgeInsets.only(left: 20.0),
              //         child: Text('Transaction History'),
              //       )
              //     ],
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.warning,
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Are you sure want to logout?',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ),
                    title: 'This is Ignored',
                    desc: 'This is also Ignored',
                    btnOkOnPress: () {
                      logout();
                    },
                    btnCancelOnPress: () {},
                  ).show();
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.logout,
                        size: MediaQuery.of(context).size.width * 0.08),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Logout'),
                    )
                  ],
                ),
              ),
              const Text('Version 1.0.0')
            ]
                .map((widget) => Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: widget,
                    ))
                .toList(),
          )),
    );
  }
}
