import 'package:flutter/material.dart';
import 'package:gokada_app/screens/home_screen.dart';
import 'package:gokada_app/screens/second_screen.dart';
import 'package:gokada_app/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            const Color(0xff00C795).withOpacity(0.85),
            const Color(0xff00C795).withOpacity(0.68),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                'Welcome Back!',
                style: TextStyle(shadows: [
                  Shadow(
                    color: Colors.blue.shade900.withOpacity(0),
                    offset: const Offset(1.0, 2.0),
                    blurRadius: 0,
                  ),
                ], fontSize: 40, fontFamily: 'Actor', color: Colors.white),
              ),
              const CustomTextFormField(
                text: 'Email',
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomTextFormField(
                text: 'Password',
              ),
              const Text(
                'Forgot Password?',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Actor', fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 70,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                  },
                  style: ButtonStyle(
                    // padding: MaterialStateProperty.all(),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0XFF00C795)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text(
                    "SIGN IN",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
