import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mume_music_player_app/constants/color_constants.dart';

class CustomHeaderListView extends StatelessWidget {
  const CustomHeaderListView({Key? key, required this.headerText})
      : super(key: key);
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headerText,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: urbanist),
          ),
          Text(
            'See All',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.w700,
              fontFamily: urbanist,
            ),
          ),
        ],
      ),
    );
  }
}
