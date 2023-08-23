import 'package:code_union/modules/system/screens/favourite_screen.dart';
import 'package:code_union/modules/system/screens/home_screen.dart';
import 'package:code_union/modules/system/screens/map_screen.dart';
import 'package:code_union/modules/system/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/helper/navigateble.dart';
import '../../core/routes/routes.dart';

class SystemScreen extends StatefulWidget implements Navigatable {
  @override
  String getName() {
    return Routes.system;
  }

  @override
  _SystemScreenState createState() => _SystemScreenState();
}

class _SystemScreenState extends State<SystemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: (index) {
          setState(
            () {
              selectedIndex = index;
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "",
          ),
        ],
        unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
        selectedItemColor: Color.fromARGB(255, 70, 49, 210),
        currentIndex: selectedIndex,
      ),
    );
  }

  List<Widget> screens = [
    HomeScreen(),
    MapScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  int selectedIndex = 0;
}
