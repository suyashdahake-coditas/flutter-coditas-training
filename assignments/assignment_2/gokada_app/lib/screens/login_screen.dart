import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 140,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Welcome Back!',
                  style: TextStyle(shadows: [
                    Shadow(
                      color: const Color(0XFF000000).withOpacity(0.1),
                      offset: const Offset(0, 4),
                      blurRadius: 3,
                    ),
                  ], fontSize: 40, fontFamily: 'Actor', color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 150,
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
              Row(
                children: const [
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Actor',
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondScreen()));
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
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 90,
                    child: Divider(
                      thickness: 1,
                      color: const Color(0xFFFFFFFF).withOpacity(0.15),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Sign in with",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Actor',
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 90,
                    child: Divider(
                      thickness: 1,
                      color: const Color(0xFFFFFFFF).withOpacity(0.15),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(
                                0, 4), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        children: [
                          SizedBox(
                              height: 35,
                              child: Image.asset("assets/images/google.png")),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Google',
                            style: TextStyle(fontFamily: 'Actor', fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "or",
                    style: TextStyle(
                        color: Colors.white, fontSize: 25, fontFamily: 'Actor'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(
                                0, 4), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        children: [
                          SizedBox(
                              height: 35,
                              child: Image.asset("assets/images/fb.png")),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'facebook',
                            style: TextStyle(fontFamily: 'Actor', fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
