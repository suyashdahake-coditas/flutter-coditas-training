import 'package:firebase_login_signup/constants.dart';
import 'package:firebase_login_signup/model/user.dart';
import 'package:firebase_login_signup/services/helper.dart';
import 'package:firebase_login_signup/ui/auth/authentication_bloc.dart';
import 'package:firebase_login_signup/ui/auth/welcome/welcome_screen.dart';
import 'package:firebase_login_signup/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  State createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  late User user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
    userId = user.userID;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.authState == AuthState.unauthenticated) {
            pushAndRemoveUntil(context, const WelcomeScreen(), false);
          }
        },
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Firebase Login SignUp',
                style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
              ),
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: kPrimaryColor,
              centerTitle: true,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtils.screenWidth * 0.06),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(user.email),
                  Text(user.userID),
                  Text(user.fullName),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthenticationBloc>().add(LogoutEvent());
                    },
                    child: Text(
                      "Logout".toUpperCase(),
                      style:
                          const TextStyle(fontFamily: "Poppins", fontSize: 21),
                    ),
                  ),
                ],
              ),
            )));
  }
}
