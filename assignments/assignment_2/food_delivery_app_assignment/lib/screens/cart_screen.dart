import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final int cartNo;

  const CartScreen({Key? key, required this.cartNo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 1,
          onPressed: () => Navigator.of(context).pop(),
          icon: Image.asset(
            'assets/images/back.png',
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Cart',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: size.width * 0.07),
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Your cart has $cartNo items.',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
