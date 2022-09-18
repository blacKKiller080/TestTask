import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthInput extends StatelessWidget {
  String text;
  int alpha;
  void Function()? onTap;

  AuthInput(this.text, this.alpha, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      child: Row(
        children: [
          Text(
            text,
            style: GoogleFonts.manrope(
                color: Color.fromARGB(255, 175, 167, 167),
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 16, right: 16),
      padding: EdgeInsets.only(bottom: 17, top: 17),
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
              color: Color.fromARGB(alpha, 165, 189, 199), width: 0.8),
        ),
      ),
    );
  }
}
