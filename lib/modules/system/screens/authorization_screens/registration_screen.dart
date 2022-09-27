// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/components/auth_button.dart';
import '../../../../core/components/auth_input.dart';
import '../../../../core/helper/navigateble.dart';
import '../../../../core/routes/routes.dart';

class RegistrationScreen extends StatelessWidget implements Navigatable {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          'Регистрация',
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
              height: 245,
              width: 375,
              margin: EdgeInsets.only(top: 32),
              color: Colors.white,
              child: Column(
                children: [
                  AuthInput('Логин', 255),
                  AuthInput('Телефон', 255),
                  AuthInput('Почта', 255),
                  AuthInput('Пароль', 0),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            AuthButton('Создать аккаунт', 327, onTap: () {
              Navigator.pushNamed(context, Routes.system);
            }),
          ],
        ),
      ),
    );
  }

  @override
  String getName() {
    return Routes.registration_screen;
  }
}
