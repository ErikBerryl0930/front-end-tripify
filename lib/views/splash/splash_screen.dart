import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/icons/logo.svg',
          width: width / 2,
          height: width / 4,
        ),
      ),
    );
  }
}