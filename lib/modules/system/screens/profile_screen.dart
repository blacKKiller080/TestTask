import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/helper/navigateble.dart';
import '../../../core/routes/routes.dart';

class ProfileScreen extends StatelessWidget implements Navigatable {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 57,
        elevation: 0,
        titleTextStyle: GoogleFonts.manrope(
          fontSize: 17,
          color: Colors.black,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 35),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.account_circle_outlined,
              size: 100,
            ),
            Text(
              "Марипбек Чингиз",
              style: GoogleFonts.manrope(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              "maripbekoff@gmail.com",
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
                height: 2,
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.authorization_screen);
                },
                child: Text(
                  "Выйти",
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.red,
                  ),
                ),
              ),
              padding: EdgeInsets.only(right: 295),
              margin: EdgeInsets.only(top: 48),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  String getName() {
    return Routes.profile_screen;
  }
}
