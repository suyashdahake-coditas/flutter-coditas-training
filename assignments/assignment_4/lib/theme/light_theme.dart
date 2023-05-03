import 'package:flutter/material.dart';

import '../constants.dart';

ThemeData buildLightTheme() {
  return ThemeData(
    primaryColor: Colors.white,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: Colors.black,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: primaryColor,
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Toronto Subway',
      ),
      unselectedLabelStyle: const TextStyle(fontSize: 16.0),
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 4.0, color: primaryColor),
        ),
      ),
    ),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(fontSize: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(150, 50)),
        elevation: MaterialStateProperty.all(0),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(const Color(0xFFFFF3E8)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    ),
  );
}