import 'package:firebase_login_signup/components/login_signup_btn.dart';
import 'package:firebase_login_signup/constants.dart';
import 'package:firebase_login_signup/services/helper.dart';
import 'package:firebase_login_signup/ui/auth/login/login_screen.dart';
import 'package:firebase_login_signup/ui/auth/signUp/sign_up_screen.dart';
import 'package:firebase_login_signup/ui/auth/welcome/welcome_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WelcomeBloc>(
      create: (context) => WelcomeBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: BlocListener<WelcomeBloc, WelcomeInitial>(
              listener: (context, state) {
                switch (state.pressTarget) {
                  case WelcomePressTarget.login:
                    push(context, const LoginScreen());
                    break;
                  case WelcomePressTarget.signup:
                    push(context, const SignUpScreen());
                    break;
                  default:
                    break;
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Center(
                    child: Text(
                      "Welcome to \nFirebase Login Signup",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        fontFamily: "Hubballi",
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 8,
                        child: Image.asset(
                            "assets/welcome_screen_ills.jpg"),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: defaultPadding * 1),
                  Row(
                    children: const [
                      Spacer(),
                      Expanded(
                        flex: 8,
                        child: LoginAndSignupBtn(),
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
