import 'package:flutter/material.dart';
import 'package:social_app/screens/explore_screen.dart';
import 'package:social_app/widgets/custom_elevated_button.dart';
import 'package:social_app/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(
            height: double.infinity,
          ),
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/login_asset.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 285,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              height: 600,
              width: 394,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextFormField(
                    labelText: 'Email',
                  ),
                  const CustomTextFormField(
                    labelText: 'Password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'FORGOT PASSWORD',
                        style:
                            TextStyle(fontSize: 17, color: Color(0XFF5252C7)),
                      )),
                  const CustomElevatedButton(
                      navigation: ExploreScreen(), buttonText: 'LOG IN'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'OR LOG IN BY',
                    style: TextStyle(fontSize: 17, color: Color(0XFF606060)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/google_icon.png'),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset('assets/images/fb_icon.png')
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Don\'t have account? ',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'SIGN UP',
                        style:
                            TextStyle(color: Color(0XFF5252C7), fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
