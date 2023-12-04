import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../customs/button_custom.dart';
import '../../functions/function_post.dart';
import '../../functions/navigation_services.dart';
import '../../functions/token_manager.dart';
import '../home/home_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confNewPasswordController =
      TextEditingController();
  bool _isObscureNewPassword = true;
  bool _isObscureConfNewPassword = true;

  void _postChangePassword(String newPassword, String confNewPassword) async {
    try {
      Map<String, String> data = {
        'newPassword': newPassword,
        'confNewPassword': confNewPassword
      };
      http.Response response = await postApiChangePassword(data);

      if (response.statusCode == 200) {
        String? token = TokenManager.extractTokenFromResponse(response.body);
        if (token != null) {
          await TokenManager.saveToken(token);
        } else {
          print('Token not found in API response');
        }
        print('Data: $data'); // Mencetak data yang akan dikirim ke API
        print(
            'Response: ${response.statusCode} ${response.body}'); // Mencetak respon dari API
        await NavigationServices.pushReplacement(const HomeScreen());
      }
    } catch (e) {
      print('Error: $e');
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
          'Setting',
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
            Text(
              'Do you want to change your password?',
              style: GoogleFonts.poppins(
                  fontSize: 28 * width / 720,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            SizedBox(height: 0.01 * height),
            TextFormField(
              controller: _newPasswordController,
              obscureText: _isObscureNewPassword,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(_isObscureNewPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      // Ubah status ketika ikon mata ditekan
                      _isObscureNewPassword = !_isObscureNewPassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your new password';
                }
                return null;
              },
            ),
            // const SizedBox(height: 16.0),
            TextFormField(
              controller: _confNewPasswordController,
              obscureText: _isObscureConfNewPassword,
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(_isObscureConfNewPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      // Ubah status ketika ikon mata ditekan
                      _isObscureConfNewPassword = !_isObscureConfNewPassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please confirm your new password';
                }
                if (value != _newPasswordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            SizedBox(height: 0.01 * height),
            ButtonCustom(
                text: 'Submit',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _postChangePassword(_newPasswordController.text,
                        _confNewPasswordController.text);
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
