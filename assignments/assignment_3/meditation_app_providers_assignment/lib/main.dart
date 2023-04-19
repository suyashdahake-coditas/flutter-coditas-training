import 'package:flutter/material.dart';
import 'package:meditation_app_providers_assignment/providers/timer_providers.dart';
import 'package:meditation_app_providers_assignment/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimerProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // textTheme: const TextTheme(titleMedium: TextStyle(fontFamily: 'Inter')),
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
