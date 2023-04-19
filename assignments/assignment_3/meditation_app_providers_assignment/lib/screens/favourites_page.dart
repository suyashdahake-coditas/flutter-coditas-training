import 'package:flutter/material.dart';
import 'package:meditation_app_providers_assignment/widgets/custom_list_tile.dart';
import 'package:provider/provider.dart';
import '../providers/timer_providers.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: value.favouritesData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const Divider(
                          thickness: 2,
                          color: Color(0xFFDBDBDB),
                          height: 0,
                        ),
                        CustomListTile(
                          title: value.favouritesData.isEmpty,
                          stopwatchData: value.favouritesData[index],
                          addHandler: () => value.addToFavourite(index),
                          deleteHandler: () => value.deleteFromFavourite(index),
                        ),
                        const Divider(
                          thickness: 2,
                          color: Color(0xFFDBDBDB),
                          height: 5,
                        ),
                      ],
                    );
                  }),
            )
          ],
        );
      },
    );
  }
}
