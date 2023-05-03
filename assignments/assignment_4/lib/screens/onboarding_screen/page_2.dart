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
              width: 395,
              height: 300,
              padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(
                  55,
                ),
              ),
              child: Column(
                children:  [
                  Text(
                    'We provide a better audio experience than others',
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
