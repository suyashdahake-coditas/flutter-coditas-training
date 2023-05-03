import 'package:flutter/material.dart';
import 'package:mume_music_player_app/constants.dart';
import 'package:mume_music_player_app/screens/home_screen/home_screen.dart';
import 'package:mume_music_player_app/screens/onboarding_screen/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mume Music Player',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white,elevation: 0,foregroundColor: Colors.black),
        tabBarTheme:  TabBarTheme(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,fontFamily: 'Toronto Subway'),
          unselectedLabelStyle: TextStyle(fontSize: 16.0),
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 4.0, color: primaryColor),
            ),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold,),
          unselectedLabelStyle: TextStyle(fontSize: 16,),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
