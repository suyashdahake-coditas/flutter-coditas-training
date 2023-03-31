import 'package:flutter/material.dart';
import 'package:social_app/screens/home_screen.dart';
import 'package:social_app/widgets/custom_elevated_button.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> data = [
      'Photographer',
      'Video Creator',
      'Illustrator',
      'Designer'
    ];
    List<String> imageString = [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
      'assets/images/4.png'
    ];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
          ),
          const Center(
              child: Text(
            'Who are you?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          )),
          SizedBox(
            height: 500,
            child: GridView.builder(
              itemCount: data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        imageString[index],
                        semanticLabel: imageString[index],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 85, horizontal: 25),
                      child: SizedBox(
                        child: Text(
                          data[index],
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomElevatedButton(
            navigation: HomeScreen(),
            buttonText: 'EXPLORE NOW',
          )
        ],
      ),
    );
  }
}
