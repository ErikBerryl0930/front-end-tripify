import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    return Scaffold(
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _newPasswordController,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your new password';
                  }
                  // Add custom validation logic as needed
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _confNewPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm New Password',
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
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _postChangePassword(_newPasswordController.text,
                        _confNewPasswordController.text);
                  }
                },
                child: const Text('Change Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
