import 'package:firebase_login_signup/constants.dart';
import 'package:firebase_login_signup/utils/app_utils.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenUtils.screenHeight  * 0.02),
      width: ScreenUtils.screenWidth * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Or",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  fontFamily: "Poppins"),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
      child: Divider(
        thickness: 1.5,
        color: Color(0xFF000000),
        height: 3,
      ),
    );
  }
}
