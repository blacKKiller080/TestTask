import 'package:code_union/modules/system/screens/authorization_screens/registration_screen.dart';
import 'package:code_union/modules/system/screens/esentai_screen.dart';
import 'package:code_union/modules/system/screens/favourite_screen.dart';
import 'package:code_union/modules/system/screens/home_screen.dart';
import 'package:code_union/modules/system/screens/map_screen.dart';
import 'package:code_union/modules/system/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'core/helper/navigateble.dart';
import 'core/routes/routes.dart';
import 'modules/splash_screen.dart';
import 'modules/system/screens/authorization_screens/authorization_screen.dart';
import 'modules/system/system_screen.dart';

void main() {
  runApp(MyApp()
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => MyApp(),
      // ),
      );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: const Color.fromARGB(255, 229, 229, 229),
          ),
          initialRoute: Routes.splash,
          routes: routes(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

routes() {
  List<Navigatable> screens = generateRoutes();
  Map<String, Widget Function(BuildContext)> routes = {};
  screens.forEach((element) {
    routes[element.getName()] = (context) => element;
  });
  return routes;
}

List<Navigatable> generateRoutes() {
  return [
    SplashScreen(),
    AuthorizationScreen(),
    SystemScreen(),
    RegistrationScreen(),
    HomeScreen(),
    MapScreen(),
    FavouriteScreen(),
    ProfileScreen(),
    EsentaiScreen(),
  ];
}
