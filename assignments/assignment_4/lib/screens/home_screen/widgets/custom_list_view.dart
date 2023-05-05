import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({Key? key, required this.imageUrl, required this.musicName}) : super(key: key);
final String imageUrl;
  final String musicName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 115.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image:
                AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            musicName,
            style: const TextStyle(
                fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
