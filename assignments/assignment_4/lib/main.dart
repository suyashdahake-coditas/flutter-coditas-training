import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mume_music_player_app/screens/splash_screen/splash_screen.dart';
import 'package:mume_music_player_app/theme/dark_theme.dart';
import 'package:mume_music_player_app/theme/light_theme.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: isDarkMode,
        builder: (BuildContext context, bool value, Widget? child) {
          return MaterialApp(
            themeMode: value ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            title: 'Mume Music Player',
            theme: buildLightTheme(),
            darkTheme: buildDarkTheme(),
            home: const SplashScreen(),
          );
        });
  }
}

final ValueNotifier<bool> isDarkMode = ValueNotifier(false);
