import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../customs/button_auth.dart';
import '../../functions/navigation_services.dart';
import '../../functions/function_post.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confPasswordController = TextEditingController();
  bool _isObscurePassword = true;
  bool _isObscureConfPassword = true;

  void _postRegister(String username, String email, String password,
      String confPassword) async {
    try {
      Map<String, String> data = {'username': username,'email': email, 'password': password, 'confPassword': confPassword};
      http.Response response = await postApiRegister(data);

      if (response.statusCode == 201) {
        await NavigationServices.pushReplacement(const LoginScreen());
        // print('Data: $data'); // Mencetak data yang akan dikirim ke API
        // print(
        //     'Response: ${response.statusCode} ${response.body}'); // Mencetak respon dari API
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
      body: Stack(children: [
        Positioned(
          bottom: 0,
          child: Image.asset(
            'assets/images/auth.png',
            fit: BoxFit.cover,
          ),
        ),
        Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'TRIPIFY',
                style: GoogleFonts.poppins(
                    fontSize: 60 * width / 720,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Text(
                '- Explore Indonesia -',
                style: GoogleFonts.dancingScript(
                    fontSize: 38 * width / 720,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              SizedBox(height: 0.01 * height),
              TextFormField(
                controller: _usernameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Username',
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
                controller: _passwordController,
                obscureText: _isObscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(_isObscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        // Ubah status ketika ikon mata ditekan
                        _isObscurePassword = !_isObscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confPasswordController,
                obscureText: _isObscureConfPassword,
                decoration: InputDecoration(
                  labelText: 'Repeat Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(_isObscureConfPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        // Ubah status ketika ikon mata ditekan
                        _isObscureConfPassword =
                            !_isObscureConfPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 0.01 * height),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: GoogleFonts.poppins(
                        fontSize: 25 * width / 720,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                          fontSize: 25 * width / 720,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0E3748)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.01 * height),
              ButtonAuth(
                  text: 'Register',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _postRegister(
                          _usernameController.text,
                          _emailController.text,
                          _passwordController.text,
                          _confPasswordController.text);
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
      ]),
    );
  }
}
