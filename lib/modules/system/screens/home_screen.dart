// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:code_union/core/components/main_containers.dart';
import 'package:code_union/core/helper/navigateble.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/components/common_input.dart';
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
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonInput(
              "Search",
              margin: EdgeInsets.only(top: 65, bottom: 25),
              type: InputType.TEXT,
              controller: searchController,
              contentPaddingVertical: 10,
              customColor: Color.fromARGB(255, 167, 168, 169),
              fillColor: Color.fromARGB(255, 229, 229, 229),
              borderRadius: 6,
              isSearch: true,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                children: [
                  MainContainers(
                    'assets/images/png/esentai.png',
                    'Esentai',
                    'Один из крупнейших торговых центров в Алматы',
                    'Аль-Фараби',
                    Routes.esentai_screen,
                  ),
                  MainContainers(
                    'assets/images/png/mega.png',
                    'Mega Center',
                    'Один из крупнейших торговых центров в Алматы',
                    'ул. Розыбакиева',
                    Routes.esentai_screen,
                  ),
                  MainContainers(
                    'assets/images/png/dostyk.png',
                    'Dostyk Plaza',
                    'Один из крупнейших торговых центров в Алматы',
                    'пр. Достык',
                    Routes.esentai_screen,
                  ),
                  MainContainers(
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

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
