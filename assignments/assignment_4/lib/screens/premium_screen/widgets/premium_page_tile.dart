import 'package:flutter/material.dart';
import 'package:mume_music_player_app/constants/color_constants.dart';
import 'package:mume_music_player_app/screens/premium_screen/widgets/custom_alert_dialog.dart';

class PremiumPageTile extends StatelessWidget {
  const PremiumPageTile(
      {super.key,
      required this.tileColor,
      required this.cost,
      required this.month});

  final Color tileColor;
  final double cost;
  final String month;

  Future<void> _showDialogBox(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(month: month);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDialogBox(context);
      },
      child: Container(
        height: 280,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: tileColor),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 60,
                  child: Image.asset(
                    "assets/images/crown1.png",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$ $cost ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontFamily: urbanist,
                          fontSize: 32),
                    ),
                    Text(
                      "/$month",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: urbanist,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                // const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Listening with better audio quality",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: urbanist,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Listening without restrictions & ads",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: urbanist,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Unlimited skips & shuffles play",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: urbanist,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
