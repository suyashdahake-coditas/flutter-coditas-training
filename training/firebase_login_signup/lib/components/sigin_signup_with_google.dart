import 'package:firebase_login_signup/utils/app_utils.dart';
import 'package:flutter/material.dart';

class SigninSinupGoogle extends StatefulWidget {
  const SigninSinupGoogle({Key? key, required this.text, this.onPress})
      : super(key: key);
  final String text;
  final Function? onPress;

  @override
  State<SigninSinupGoogle> createState() => _SigninSinupGoogleState();
}

class _SigninSinupGoogleState extends State<SigninSinupGoogle> {
// final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress as void Function()?,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF555555)),
          borderRadius: BorderRadius.circular(10),
        ),
        height: ScreenUtils.screenHeight  * 0.06,
        child: Row(
          children: [
            SizedBox(
              width: ScreenUtils.screenWidth  * 0.02,
            ),
            SizedBox(
              height: ScreenUtils.screenHeight  * 0.04,
              child: Image.asset("assets/google_icon.png"),
            ),
            SizedBox(
              width: ScreenUtils.screenWidth  * 0.15,
            ),
            Text(
              widget.text,
              style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF555555)),
            )
          ],
        ),
      ),
    );
  }
}
