import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonPassed extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ButtonPassed({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width * 0.8, // 80% of screen width
        height: height * 0.06, // 6% of screen height
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0x7F2A2A2A)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
