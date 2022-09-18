import 'package:code_union/core/helper/navigateble.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes/routes.dart';

class FavouriteScreen extends StatefulWidget implements Navigatable {
  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();

  @override
  String getName() {
    return Routes.favourite_screen;
  }
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Избранные'),
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 57,
        elevation: 0,
        titleTextStyle: GoogleFonts.manrope(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 138, left: 20, right: 20, bottom: 20),
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
          ],
        ),
      ),
    );
  }

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
}
