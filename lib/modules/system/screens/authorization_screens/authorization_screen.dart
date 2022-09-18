// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/components/auth_button.dart';
import '../../../../core/components/auth_input.dart';
import '../../../../core/helper/navigateble.dart';
import '../../../../core/routes/routes.dart';

class AuthorizationScreen extends StatelessWidget implements Navigatable {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Авторизация',
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 57,
        titleTextStyle: GoogleFonts.manrope(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      body: Container(
        height: height,
        child: Column(
          children: [
            Container(
              height: 123,
              width: 375,
              margin: EdgeInsets.only(top: 224),
              color: Colors.white,
              child: Column(
                children: [
                  AuthInput('Логин или почта', 255),
                  AuthInput('Пароль', 0),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            AuthButton('Войти', 32),
            AuthButton(
              'Зарегистрироваться',
              19,
              onTap: () {
                Navigator.pushNamed(context, Routes.registration_screen);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  String getName() {
    return Routes.authorization_screen;
  }
}
