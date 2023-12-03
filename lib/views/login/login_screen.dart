import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tripify_app/provider/user_provider.dart';

import '../../customs/button_auth.dart';
import '../../functions/function_post.dart';
import '../home/home_screen.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _postLogin(String email, String password) async {
    try {
      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);
      Map<String, String> data = {'email': email, 'password': password};
      http.Response response = await postApiLogin(data);

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        userProvider.updateUserFromResponse(data, context);
        print('Data: $data'); // Mencetak data yang akan dikirim ke API
        print(
            'Response: ${response.statusCode} ${response.body}'); // Mencetak respon dari API
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          duration: Duration(seconds: 2), // Durasi tampilan snackbar
        ),
      );
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
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  // Validasi tambahan jika diperlukan (misalnya, panjang password)
                  return null;
                },
              ),
              SizedBox(height: 0.01 * height),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account? ',
                    style: GoogleFonts.poppins(
                        fontSize: 25 * width / 720,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: Text(
                      'Register',
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
                  text: 'Login',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _postLogin(
                          _emailController.text, _passwordController.text);
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

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;

// import '../../customs/button_auth.dart';
// import '../../functions/function_post.dart';
// import '../home/home_screen.dart';
// import '../register/register_screen.dart';

// //coba re ry
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   Future postLogin(String email, String password) async {
//     Map<String, String> data = {'email': email, 'password': password};
//     http.Response response = await postApiLogin(data);

//     if (response.statusCode == 200) {
//       print('Response data: ${response.body}');
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     TextEditingController emailController = TextEditingController();
//     TextEditingController passwordController = TextEditingController();
//     final _formKey = GlobalKey<FormState>();
//     return Scaffold(
//         appBar: null,
//         body: Stack(
//           children: [
//             Positioned(
//               bottom: 0,
//               child: Image.asset(
//                 'assets/images/auth.png',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(children: <Widget>[
//                     Text(
//                       'TRIPIFY',
//                       style: GoogleFonts.poppins(
//                           fontSize: 60 * width / 720,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black),
//                     ),
//                     Text(
//                       '- Explore Indonesia -',
//                       style: GoogleFonts.dancingScript(
//                           fontSize: 38 * width / 720,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black),
//                     ),
//                   ]),
//                   SizedBox(height: 0.01 * height),
//                   TextFormField(
//                     autofocus: true,
//                     controller: emailController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       labelText: "Email",
//                       prefixIcon: const Icon(Icons.email),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Provide an email';
//                       }
//                       return null;
//                     },
//                   ),
//                   TextFormField(
//                     controller: passwordController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       labelText: "Password",
//                       prefixIcon: const Icon(Icons.lock),
//                     ),
//                     keyboardType: TextInputType.visiblePassword,
//                     obscureText: true,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Required a password';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 0.01 * height),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Don’t have an account? ',
//                         style: GoogleFonts.poppins(
//                             fontSize: 25 * width / 720,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.black),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const RegisterScreen()),
//                           );
//                         },
//                         child: Text(
//                           'Register',
//                           style: GoogleFonts.poppins(
//                               fontSize: 25 * width / 720,
//                               fontWeight: FontWeight.bold,
//                               color: const Color(0xFF0E3748)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 0.01 * height),
//                   ButtonAuth(
//                       text: 'Login',
//                       onPressed: () async {
//                         if (_formKey.currentState!.validate()) {
//                           String email = emailController.text;
//                           String password = passwordController.text;

//                           try {
//                             await postLogin(email, password);
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const HomeScreen()),
//                             );
//                           } catch (e) {
//                             print('Error: $e');
//                             // Handle error (e.g., show error message)
//                           }
//                         }
//                       }),
//                 ]
//                     .map((widget) => Padding(
//                           padding: const EdgeInsets.only(
//                               top: 10.0, left: 10.0, right: 10.0),
//                           child: widget,
//                         ))
//                     .toList(),
//               ),
//             ),
//           ],
//         ));
//   }
// }
