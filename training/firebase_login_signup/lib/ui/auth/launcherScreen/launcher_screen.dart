import 'package:firebase_login_signup/constants.dart';
import 'package:firebase_login_signup/services/helper.dart';
import 'package:firebase_login_signup/ui/auth/authentication_bloc.dart';
import 'package:firebase_login_signup/ui/auth/welcome/welcome_screen.dart';
import 'package:firebase_login_signup/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LauncherScreen extends StatefulWidget {
  const LauncherScreen({Key? key}) : super(key: key);

  @override
  State<LauncherScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthenticationBloc>().add(CheckFirstRunEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          switch (state.authState) {
            case AuthState.firstRun:
              pushReplacement(context, const WelcomeScreen());
              break;
            case AuthState.authenticated:
              pushReplacement(context, HomeScreen(user: state.user!));
              break;
            case AuthState.unauthenticated:
              pushReplacement(context, const WelcomeScreen());
              break;
          }
        },
        child: const Center(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation(kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
