import 'dart:io';

import 'package:code_union/core/helper/navigateble.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes/routes.dart';

class EsentaiScreen extends StatefulWidget implements Navigatable {
  const EsentaiScreen({Key? key}) : super(key: key);

  @override
  State<EsentaiScreen> createState() => _EsentaiScreenState();

  @override
  String getName() {
    return Routes.esentai_screen;
  }
}

class _EsentaiScreenState extends State<EsentaiScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    bool flag = false;
    Color _favIconColor = Colors.white;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Esentai Mall'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        toolbarHeight: 54,
        elevation: 0,
        titleTextStyle: GoogleFonts.manrope(
          fontSize: 20,
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                if (!flag && _favIconColor == Colors.white) {
                  _favIconColor = Colors.red;
                  flag = true;
                } else {
                  _favIconColor = Colors.white;
                  flag = false;
                }
              });
            },
            icon: Icon(
              Icons.favorite_border_outlined,
              color: _favIconColor,
            ),
          ),
        ],
      ),
      body: Container(
        height: height,
        width: double.infinity,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/png/esentaiBig.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Container(
                  height: 265.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topCenter,
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.black.withAlpha(200),
                      ],
                      stops: [0.0, 1.0],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Описание",
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 146, 146, 146),
                        fontSize: 13,
                        height: 1.9),
                  ),
                  Text(
                    "Новый способ обжарки хачапури только у нас. И вкуснейшие салатики малибу и горячие шашлыки только у нас",
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        height: 1.5),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Подробнее",
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 70, 49, 210),
                        fontSize: 13,
                        height: 2.5),
                  ),
                ],
              ),
              padding: EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 20),
              decoration: BoxDecoration(
                border: BorderDirectional(
                  bottom: BorderSide(
                      color: Color.fromARGB(255, 165, 189, 199), width: 1),
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.watch_later_outlined),
                      Text(
                        "Работаем с 20:00 до 18:00",
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(
                        "Аль-Фараби",
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              height: 100,
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 19, bottom: 21),
              decoration: BoxDecoration(
                border: BorderDirectional(
                  bottom: BorderSide(
                      color: Color.fromARGB(255, 165, 189, 199), width: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
