import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
              'assets/images/intro2.png',
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
                    'We provide a better audio experience than others',
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

