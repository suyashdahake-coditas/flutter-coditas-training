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
            height: double.infinity,
            child: Image.asset(
              'assets/images/intro13756770.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 500,
            child: Container(
              width: 395,
              height: 300,
              padding: EdgeInsets.only(top: 30,left: 20,right: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(
                  55,
                ),
              ),
              child: Column(
                children:  [
                  Text(
                    'User friendly mp3 music player for your device',
                    style: Theme.of(context).textTheme.displayLarge,
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
