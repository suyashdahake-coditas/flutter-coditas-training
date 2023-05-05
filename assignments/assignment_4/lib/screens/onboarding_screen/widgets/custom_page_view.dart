import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key, required this.imagePath, required this.text}) : super(key: key);
final String imagePath;
final String text;
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          const SizedBox(
            height: double.infinity,
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 500,
            child: Container(
              width: 395,
              height: 300,
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(
                  55,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      );
  }
}
