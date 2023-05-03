import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mume_music_player_app/screens/onboarding_screen/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => OnBoardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage("assets/images/logo_2.png"),
                width: 50,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Mume",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Toronto Subway'),
              )
            ],
          ),
          const SizedBox(
            height: 200,
          ),
          const SpinKitCircle(
            color: Color.fromARGB(255, 231, 137, 50),
            size: 80.0,
          ),
        ]),
      ),
    );
  }
}
