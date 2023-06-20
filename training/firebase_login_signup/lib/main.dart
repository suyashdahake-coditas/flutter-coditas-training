import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login_signup/ui/auth/authentication_bloc.dart';
import 'package:firebase_login_signup/ui/auth/launcherScreen/launcher_screen.dart';
import 'package:firebase_login_signup/ui/loading_cubit.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(),
      child: BlocProvider<LoadingCubit>(
        create: (context) => LoadingCubit(),
        child: const MyApp(),
      )));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      if (kIsWeb) {
        await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
      } else {
        await Firebase.initializeApp();
      }
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return MaterialApp(
          home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
              child: Column(
            children: const [
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 25,
              ),
              SizedBox(height: 16),
              Text(
                'Failed to initialise firebase!',
                style: TextStyle(color: Colors.red, fontSize: 25),
              ),
            ],
          )),
        ),
      ));
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }

    return MaterialApp(
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: kPrimaryColor,
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: kPrimaryLightColor,
              iconColor: kPrimaryColor,
              prefixIconColor: kPrimaryColor,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
            )),
        // darkTheme: ThemeData(
        //     brightness: Brightness.dark,
        //     scaffoldBackgroundColor: Colors.grey.shade800,
        //     appBarTheme: const AppBarTheme(
        //         systemOverlayStyle: SystemUiOverlayStyle.light),
        //     snackBarTheme: const SnackBarThemeData(
        //         contentTextStyle: TextStyle(color: Colors.white)),
        //     colorScheme: ColorScheme.fromSwatch().copyWith(
        //         secondary: const Color(colorPrimary),
        //         brightness: Brightness.dark)),
        debugShowCheckedModeBanner: false,
        color: kPrimaryColor,
        home: const LauncherScreen());
  }

  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
  }
}
