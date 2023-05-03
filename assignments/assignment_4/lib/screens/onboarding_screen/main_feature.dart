import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mume_music_player_app/screens/onboarding_screen/page_1.dart';
import 'package:mume_music_player_app/screens/onboarding_screen/page_2.dart';
import 'package:mume_music_player_app/screens/onboarding_screen/page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainFeaturesPage extends StatelessWidget {
  MainFeaturesPage({super.key});
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
              effect: const ExpandingDotsEffect(
                  activeDotColor: Color.fromARGB(255, 231, 137, 50),
                  dotColor: Colors.grey,
                  dotHeight: 7,
                  dotWidth: 7),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () => {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                ),
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 160.0,
                  vertical: 16.0,
                ),
                backgroundColor: Color.fromARGB(255, 231, 137, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    40.0,
                  ),
                ),
              ),
              child: const Text('Next'),
            )
          ],
        ));
  }
}

