import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF00C795),
      body: Column(
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
            ], fontSize: 30, fontFamily: 'Actor', color: Colors.white),
          ),
          TextFormField(
            decoration: const InputDecoration(
                hintStyle: TextStyle(fontFamily: 'Actor', color: Color(0XFF)),
                hintText: 'Email',
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 25)),
          ),
        ],
      ),
    );
  }
}
