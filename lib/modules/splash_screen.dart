import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/components/gradient_text.dart';
import '../core/helper/navigateble.dart';
import '../core/routes/routes.dart';

class SplashScreen extends StatefulWidget implements Navigatable {
  @override
  _SplashScreenState createState() => _SplashScreenState();

  @override
  String getName() {
    return Routes.splash;
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacementNamed(Routes.authorization_screen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GradientText(
          'Code Union',
          style: const TextStyle(fontSize: 50),
          gradient: LinearGradient(colors: [
            Colors.blue.shade400,
            Colors.blue.shade900,
          ]),
        ),
      ),
    );
  }
}
