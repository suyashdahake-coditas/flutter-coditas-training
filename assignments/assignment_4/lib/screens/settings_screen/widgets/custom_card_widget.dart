import 'package:flutter/material.dart';
import 'package:mume_music_player_app/constants/color_constants.dart';

import '../../premium_screen/premium_screen.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 190,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
                colors: [Color.fromARGB(216, 249, 124, 0), Colors.amber],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 10),
              Text(
                "Enjoy All Benefits!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: urbanist,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 183,
                child: Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: urbanist,
                  ),
                  "Enjoy listening songs with better audio quality, without restrictions, and without ads.",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(140, 40)),
                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PremiumPage(),
                    ),
                  );
                },
                child: Text(
                  "Get Premium",
                  style: TextStyle(
                    fontFamily: urbanist,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 150,
          top: 10,
          bottom: 1,
          child: SizedBox(
            height: 200,
            width: 300,
            child: Image.asset("assets/images/image1.png"),
          ),
        )
      ],
    );
  }
}
