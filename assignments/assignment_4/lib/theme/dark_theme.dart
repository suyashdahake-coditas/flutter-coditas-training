import 'package:flutter/material.dart';

import '../constants.dart';

ThemeData buildDarkTheme() {
  return ThemeData(
    primaryColor: Colors.black,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      foregroundColor: Colors.white,
    ),
    tabBarTheme: TabBarTheme(
      labelColor:primaryColor,
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Toronto Subway',
      ),
      unselectedLabelStyle: const TextStyle(fontSize: 18.0),
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 4.0, color: primaryColor),
        ),
      ),
    ),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      backgroundColor: Colors.black,
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
        backgroundColor: MaterialStateProperty.all(const Color(0xFF35383F)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    ),
  );
}