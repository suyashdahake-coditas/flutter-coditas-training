import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String restaurantName;
  final String address;

  const CustomCard(
      {super.key,
        required this.imageUrl,
        required this.restaurantName,
        required this.address});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: Card(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        restaurantName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Image.asset('assets/images/rating.png'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    address,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}