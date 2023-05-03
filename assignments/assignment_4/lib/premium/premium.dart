import 'package:flutter/material.dart';
import 'package:mume_music_player_app/premium/premium_page_tile.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
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
                const Text(
                  "Subscribe to Premium",
                  style: TextStyle(
                      color: Color.fromARGB(216, 249, 124, 0),
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enjoy listening songs with better audio quality, without restrictions, and without ads.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                PremiumPageTile(
                    boxColor: Colors.orange, month: 'month', rate: 9.99),
                const SizedBox(
                  height: 20,
                ),
                PremiumPageTile(
                    boxColor: Colors.purple, month: "3 months", rate: 19.99),
                const SizedBox(
                  height: 20,
                ),
                PremiumPageTile(
                    boxColor: Colors.redAccent,
                    month: "12 months",
                    rate: 75.99),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
