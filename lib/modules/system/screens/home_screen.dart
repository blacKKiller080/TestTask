// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:code_union/core/helper/navigateble.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/styles.dart';
import '../../../core/routes/routes.dart';

class HomeScreen extends StatefulWidget implements Navigatable {
  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  String getName() {
    return Routes.home_screen;
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchButton(),
            Container(
              height: 580,
              child: ListView(
                padding: EdgeInsets.zero,
                physics: ClampingScrollPhysics(),
                children: [
                  mainList(
                    'assets/images/png/esentai.png',
                    'Esentai Mall',
                    'Один из крупнейших торговых центров в Алматы',
                    'Аль-Фараби',
                    Routes.esentai_screen,
                  ),
                  mainList(
                    'assets/images/png/mega.png',
                    'Mega Center',
                    'Один из крупнейших торговых центров в Алматы',
                    'ул. Розыбакиева',
                    Routes.esentai_screen,
                  ),
                  mainList(
                    'assets/images/png/dostyk.png',
                    'Dostyk Plaza',
                    'Один из крупнейших торговых центров в Алматы',
                    'пр. Достык',
                    Routes.esentai_screen,
                  ),
                  mainList(
                    'assets/images/png/esentai.png',
                    'Forum',
                    'Один из крупнейших торговых центров в Алматы',
                    'Аль-Фараби',
                    Routes.esentai_screen,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget SearchButton() => Container(
        margin: EdgeInsets.only(top: 64),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Color.fromARGB(255, 167, 168, 169),
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Color.fromARGB(255, 146, 146, 146),
            ),
            Text(
              'Поиск',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                  color: Color.fromARGB(255, 146, 146, 146),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );

  String disabled = "";
  bool flag = false;
  Color _favIconColor = Colors.grey;

  Widget mainList(String imagePath, String mainLabel, String subText,
          String location, String routeName) =>
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset(
                    imagePath,
                    width: 371.4,
                    fit: BoxFit.cover,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mainLabel,
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                height: 1.5,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              subText,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 146, 146, 146),
                                fontSize: 13,
                                height: 1.5,
                              ),
                            ),
                            Text(
                              location,
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 146, 146, 146),
                                fontSize: 13,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.only(left: 16),
                        margin: EdgeInsets.only(right: 20),
                        width: 300,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            disabled = mainLabel;
                            if (disabled == mainLabel &&
                                !flag &&
                                _favIconColor == Colors.grey) {
                              _favIconColor = Colors.red;
                              flag = true;
                            } else {
                              _favIconColor = Colors.grey;
                              flag = false;
                            }
                          });
                        },
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: disabled == mainLabel
                              ? _favIconColor
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          width: 371.4,
          height: 234,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      );

  @override
  void dispose() {
    super.dispose();
  }
}
