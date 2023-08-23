// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../core/components/auth_button.dart';
import '../../../../core/components/auth_input.dart';
import '../../../../core/components/common_button.dart';
import '../../../../core/components/common_input.dart';
import '../../../../core/helper/input_helper.dart';
import '../../../../core/helper/navigateble.dart';
import '../../../../core/routes/routes.dart';

class AuthorizationScreen extends StatefulWidget implements Navigatable {
  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();

  @override
  String getName() {
    return Routes.authorization_screen;
  }
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  bool isLoginButtonDisabled = true;
  MaskTextInputFormatter formatter = InputHelper.phoneTextInputFormatter();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              margin: EdgeInsets.only(top: 220),
              color: Colors.white,
              child: Column(
                children: [
                  CommonInput(
                    "Введите номер",
                    margin: EdgeInsets.only(top: 0),
                    type: InputType.PHONE,
                    controller: phoneController,
                    formatters: [formatter],
                    borderRadius: 0,
                    contentPaddingVertical: 25,
                    onChanged: (val) {
                      if (val.length == 18) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                  CommonInput(
                    "Введите пароль",
                    margin: EdgeInsets.only(top: 0),
                    type: InputType.PASSWORD,
                    controller: passwordController,
                    borderRadius: 0,
                    borderAlpha: 0,
                    contentPaddingVertical: 25,
                    onChanged: (val) {
                      if (phoneController.text.length == 18 &&
                          passwordController.text.length >= 8) {
                        isLoginButtonDisabled = val == '';
                      } else {
                        isLoginButtonDisabled = true;
                      }
                    },
                    onSubmitted: (val) {
                      if (phoneController.text.length == 18 &&
                          passwordController.text.length >= 8) {
                        isLoginButtonDisabled = val == '';

                        //Navigator.pushReplacementNamed(context, Routes.system);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Wrong password"),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            CommonButton(
              child: Text('Войти'),
              onPressed: () {
                //login(),
                Navigator.pushNamed(context, Routes.system);
              },
              margin: EdgeInsets.only(top: 19, left: 15, right: 15),
              success: true,
              disabled: isLoginButtonDisabled,
            ),
            CommonButton(
              child: Text('Зарегистрироваться'),
              onPressed: () {
                //login(),
                Navigator.pushNamed(context, Routes.registration_screen);
              },
              margin: EdgeInsets.only(top: 19, left: 15, right: 15),
              success: true,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }
}
