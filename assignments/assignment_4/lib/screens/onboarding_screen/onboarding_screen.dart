import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mume_music_player_app/screens/onboarding_screen/main_feature.dart';

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
          CupertinoPageRoute(builder: (ctx) => MainFeaturesPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 200,
              ),
              Image(
                image: AssetImage("assets/images/logo.png"),
                width: 300,
              ),
              SizedBox(
                height: 250,
              ),
              SpinKitCircle(
                color: Color.fromARGB(255, 231, 137, 50),
                size: 80.0,
              ),
            ]),
      ),

    );
  }
}
