import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripify_app/customs/button_passed.dart';
import 'package:tripify_app/customs/button_started.dart';
import 'package:tripify_app/views/onboard/slider.dart';

import '../login/login_screen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: contents.length,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, i) {
              double width = MediaQuery.of(context).size.width;
              double height = MediaQuery.of(context).size.height;
              return Column(
                children: [
                  Container(
                    height: height * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(contents[i].image),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(contents.length,
                            (index) => buildDot(index, context, width))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          contents[i].title,
                          style: GoogleFonts.poppins(
                              fontSize: 32 * width / 720,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          contents[i].description,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 25 * width / 720,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Menampilkan "Get Started" hanya di last index
                if (currentIndex == contents.length - 1)
                  ButtonStarted(
                    text: 'Get Started',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                // Menampilkan "Skip" untuk indeks lainnya
                if (currentIndex != contents.length - 1)
                  ButtonPassed(
                    text: 'Skip',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context, double width) {
    return Container(
      height: 7 * width / 720,
      width: currentIndex == index ? 28 * width / 720 : 10 * width / 720,
      margin: EdgeInsets.only(right: 5 * width / 720),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20 * width / 720),
          color: const Color(0xFF004C5C)),
    );
  }
}
