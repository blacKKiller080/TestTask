import 'package:code_union/core/components/main_containers.dart';
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
        margin: EdgeInsets.only(top: 140, left: 20, right: 20, bottom: 20),
        child: ListView(
          padding: EdgeInsets.zero,
          physics: ClampingScrollPhysics(),
          children: [
            MainContainers(
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
}
