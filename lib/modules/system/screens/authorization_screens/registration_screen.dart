// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../core/components/auth_button.dart';
import '../../../../core/components/auth_input.dart';
import '../../../../core/components/common_input.dart';
import '../../../../core/helper/input_helper.dart';
import '../../../../core/helper/navigateble.dart';
import '../../../../core/routes/routes.dart';

class RegistrationScreen extends StatefulWidget implements Navigatable {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();

  @override
  String getName() {
    return Routes.registration_screen;
  }
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  MaskTextInputFormatter formatter = InputHelper.phoneTextInputFormatter();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              margin: EdgeInsets.only(top: 32),
              color: Colors.white,
              child: Column(
                children: [
                  CommonInput(
                    "Введите логин",
                    margin: EdgeInsets.only(top: 0),
                    type: InputType.TEXT,
                    controller: nameController,
                    borderRadius: 0,
                    contentPaddingVertical: 25,
                    onSubmitted: (val) {
                      if (val.length >= 3) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                  CommonInput(
                    "Телефон",
                    margin: EdgeInsets.only(top: 0),
                    type: InputType.PHONE,
                    controller: phoneController,
                    borderRadius: 0,
                    formatters: [formatter],
                    contentPaddingVertical: 25,
                    onChanged: (val) {
                      if (val.length == 18) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                  CommonInput(
                    "Почта",
                    margin: EdgeInsets.only(top: 0),
                    type: InputType.EMAIL,
                    controller: emailController,
                    borderRadius: 0,
                    contentPaddingVertical: 25,
                    onSubmitted: (val) {
                      if (emailController.text.contains('@') &&
                          emailController.text.contains('.')) {
                        FocusScope.of(context).nextFocus();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Почта введена неправильно"),
                          ),
                        );
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
                    onSubmitted: (val) {
                      if (passwordController.text.length >= 8) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Correct password"),
                          ),
                        );
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            AuthButton('Создать аккаунт', 290, onTap: () {
              Navigator.pushNamed(context, Routes.system);
            }),
          ],
        ),
      ),
    );
  }
}
