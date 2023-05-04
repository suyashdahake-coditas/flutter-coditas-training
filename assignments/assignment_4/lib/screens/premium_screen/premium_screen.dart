import 'package:flutter/material.dart';
import 'package:mume_music_player_app/screens/premium_screen/widgets/premium_page_tile.dart';

import '../../constants.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Set the custom icon here
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Text(
                  "Subscribe to Premium",
                  style: TextStyle(
                      fontFamily: urbanist,
                      color: Color.fromARGB(216, 249, 124, 0),
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                 SizedBox(
                  width: 300,
                  child: Text(
                    "Enjoy listening songs with better audio quality, without restrictions, and without ads.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: urbanist,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                PremiumPageTile(
                    tileColor: Colors.orange, month: 'month', cost: 9.99),
                const SizedBox(
                  height: 20,
                ),
                PremiumPageTile(
                    tileColor: Colors.purple, month: "3 months", cost: 19.99),
                const SizedBox(
                  height: 20,
                ),
                PremiumPageTile(
                    tileColor: Colors.redAccent,
                    month: "12 months",
                    cost: 75.99),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
