import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

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
              'assets/images/intro13756770.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 500,
            child: Container(
              width: 430,
              height: 300,
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  55,
                ),
              ),
              child: Column(
                children: const [
                  Text(
                    'User friendly mp3 music player for your device',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
