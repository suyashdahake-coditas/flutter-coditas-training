import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/auth_provider.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:flutter_provider/provider/example_one_provider.dart';
import 'package:flutter_provider/provider/example_two_provider.dart';
import 'package:flutter_provider/screens/examples/favourite_example/example_two_screen.dart';
import 'package:flutter_provider/screens/examples/value_notifier_listner.dart';
import 'package:flutter_provider/screens/login_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => ExampleTwoProvider()),
          ChangeNotifierProvider(create: (_) =>  AuthProvider()),

        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:  LoginScreen()
        )
    );
  }
}

