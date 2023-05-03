import 'package:flutter/material.dart';
import 'package:mume_music_player_app/constants.dart';
import 'package:mume_music_player_app/screens/onboarding_screen/page_1.dart';
import 'package:mume_music_player_app/screens/onboarding_screen/page_2.dart';
import 'package:mume_music_player_app/screens/onboarding_screen/page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../home_screen/home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            SizedBox(
              height: 700,
              child: PageView(
                controller: _controller,
                children: const [
                  Page1(),
                  Page2(),
                  Page3(),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                  activeDotColor: primaryColor,
                  dotColor: Colors.grey,
                  dotHeight: 7,
                  dotWidth: 7),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                int? index = _controller.page?.round();
                if (index! < 2) {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 150.0,
                  vertical: 14.0,
                ),
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    40.0,
                  ),
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ));
  }
}
