import 'package:flutter/material.dart';
import 'package:gokada_app/widgets/custom_card.dart';
import '../dummyData.dart';

class CustomListView extends StatelessWidget {
  final List data;

  CustomListView({required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mostPopularDummyData.length,
        itemBuilder: (context, index) => CustomCard(
            imageUrl: data[index].imageUrl,
            restaurantName: data[index].restaurantName,
            address: data[index].address),
      ),
    );
  }
}