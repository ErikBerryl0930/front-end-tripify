import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../customs/button_auth.dart';
import '../../functions/function_post.dart';
import '../home/home_screen.dart';
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
  final TextEditingController _confpasswordController = TextEditingController();

  Future postLogin(String email, String password) async {
    Map<String, String> data = {'email': email, 'password': password};
    http.Response response = await postApiLogin(data);

    if (response.statusCode == 200) {
      print('Response data: ${response.body}');
    } else {
      throw Exception('Failed to load data');
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Validasi sukses, lakukan sesuatu
      String email = _emailController.text;
      String password = _passwordController.text;

      // Misalnya, panggil fungsi login atau navigasi ke halaman beranda
      // login(email, password);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      print('Email: $email');
      print('Password: $password');
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
                  // Tambahan validasi email jika diperlukan
                  // if (!EmailValidator.validate(value)) {
                  //   return 'Invalid email';
                  // }
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
                  // Tambahan validasi email jika diperlukan
                  // if (!EmailValidator.validate(value)) {
                  //   return 'Invalid email';
                  // }
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
              TextFormField(
                controller: _confpasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Repeat Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password';
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
                    'Already have an account? ',
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
                      String email = _emailController.text;
                      String password = _passwordController.text;

                      try {
                        await postLogin(email, password);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      } catch (e) {
                        print('Error: $e');
                        // Handle error (e.g., show error message)
                      }
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

// import '../../customs/button_auth.dart';
// import '../login/login_screen.dart';

// class RegisterScreen extends StatelessWidget {
//   const RegisterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     TextEditingController usernameController = TextEditingController();
//     TextEditingController emailController = TextEditingController();
//     TextEditingController passwordController = TextEditingController();
//     TextEditingController confpasswordController = TextEditingController();
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
//                     controller: usernameController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       labelText: "Username",
//                       prefixIcon: const Icon(Icons.person),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Provide a username';
//                       }
//                       return null;
//                     },
//                   ),
//                   TextFormField(
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
//                         return 'Enter a password';
//                       }
//                       return null;
//                     },
//                   ),
//                   TextFormField(
//                     controller: confpasswordController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       labelText: "Repeat Password",
//                       prefixIcon: const Icon(Icons.lock),
//                     ),
//                     keyboardType: TextInputType.visiblePassword,
//                     obscureText: true,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Confirm password';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 0.01 * height),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Already have an account? ',
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
//                                 builder: (context) => const LoginScreen()),
//                           );
//                         },
//                         child: Text(
//                           'Login',
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
//                     text: 'Register',
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                           String username = usernameController.text;
//                           String email = emailController.text;
//                           String password = passwordController.text;
//                           String confpassword = confpasswordController.text;

//                           try {
//                             // await postLogin(email, password);
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const LoginScreen()),
//                             );
//                           } catch (e) {
//                             print('Error: $e');
//                             // Handle error (e.g., show error message)
//                           }
//                         }
//                     },
//                   ),
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
