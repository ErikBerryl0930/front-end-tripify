import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripify_app/app/modules/login/views/login_view.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(top: 60, left: 16, right: 16),
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Form(
                // key: controller.registerFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    const Positioned(
                      child: Text(
                        'TRIPIFY',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Positioned(
                      child: Text(
                        '- Explore Indonesia -',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'DancingScript',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Email",
                        prefixIcon: const Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      // controller: controller.emailController,
                      // onSaved: (value) {
                      //   controller.email = value!;
                      // },
                      // validator: (value) {
                      //   return controller.validateEmail(value!);
                      // },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Username",
                        prefixIcon: const Icon(Icons.person),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      // controller: controller.emailController,
                      // onSaved: (value) {
                      //   controller.email = value!;
                      // },
                      // validator: (value) {
                      //   return controller.validateEmail(value!);
                      // },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      // controller: controller.passwordController,
                      // onSaved: (value) {
                      //   controller.password = value!;
                      // },
                      // validator: (value) {
                      //   return controller.validatePassword(value!);
                      // },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Repeat Password",
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      // controller: controller.passwordController,
                      // onSaved: (value) {
                      //   controller.password = value!;
                      // },
                      // validator: (value) {
                      //   return controller.validatePassword(value!);
                      // },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Positioned(
                          child: Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: const Text(
                            ' Login',
                            style: TextStyle(
                              color: Color(0xFF004C5C),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const LoginView()));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: context.width),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF004C5C)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(14)),
                        ),
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        onPressed: () {
                          // controller.checkLogin();
                        },
                      ),
                    ),
                  ],
                )),
            // Positioned(
            //     top: context.height / 2,
            //     child: Container(
            //       width: context.width,
            //       height: context.height / 2,
            //       decoration: const BoxDecoration(
            //         image: DecorationImage(
            //           image: AssetImage('assets/images/auth.png'),
            //           fit: BoxFit.cover,
            //           // repeat: ImageRepeat.noRepeat,
            //         ),
            //       ),
            //     ))
          )),
    );
  }
}
