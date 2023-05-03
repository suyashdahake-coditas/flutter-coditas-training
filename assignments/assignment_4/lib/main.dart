import 'package:flutter/material.dart';
import 'package:mume_music_player_app/screens/onboarding_screen/splash_screen.dart';
import 'package:mume_music_player_app/theme/dark_theme.dart';
import 'package:mume_music_player_app/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final ValueNotifier<bool> isDarkMode = ValueNotifier(true);


class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: isDarkMode,
        builder: (BuildContext context, bool value, Widget? child) {
      return MaterialApp(
        themeMode: value?ThemeMode.dark:ThemeMode.light,
        debugShowCheckedModeBanner: false,
        title: 'Mume Music Player',
        theme: buildLightTheme(),
        darkTheme: buildDarkTheme(),
        home: SplashScreen(),
      );}
    );
  }
}
