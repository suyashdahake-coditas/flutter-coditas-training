import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

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
              'assets/images/intro13756851.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 500,
            child: Container(
              width: 430,
              height: 300,
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  55,
                ),
              ),
              child: Column(
                children: const [
                  Text(
                    'Listen to the best audio and music with Mume now !',
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

