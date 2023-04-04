import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  CustomGridView({super.key});

  List<String> data = ['GRide', 'GFood', 'GSend', 'GShop'];
  List<String> imageString = [
    'assets/images/motorcycle.png',
    'assets/images/pot-of-food.png',
    'assets/images/noto_package.png',
    'assets/images/shopping-bags.png'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: ,
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 0, crossAxisSpacing: 0, crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 90,
                    child: Image.asset(
                      imageString[index],
                      semanticLabel: imageString[index],
                    ),
                  ),
                  const SizedBox(height:05,),
                  Text(
                    data[index],
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}