import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomAlertDialog extends StatelessWidget {
  final String month;

  const CustomAlertDialog({Key? key, required this.month}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
      alignment: Alignment.center,
      title: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: 120,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor,
            ),
            child: Image.asset(
              'assets/images/crown1.png',
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Congratulations!",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 28,
                  fontFamily: urbanist,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "You have Successfully Subscribed $month of Premium. Enjoy the benefits!",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: urbanist),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.all(8)),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'OK',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
