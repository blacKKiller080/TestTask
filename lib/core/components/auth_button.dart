import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthButton extends StatelessWidget {
  String text;
  double top;
  void Function()? onTap;

  AuthButton(this.text, this.top, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: top),
        height: 64,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.manrope(
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 70, 49, 210),
        ),
      ),
    );
  }
}
