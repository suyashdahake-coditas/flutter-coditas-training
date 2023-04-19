import 'package:flutter/material.dart';
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
                        ListTile(
                            title: value.stopwatchData.isEmpty
                                ? const Text("0")
                                : Text(
                              value.stopwatchData[index],
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Inter'),
                            ),
                            trailing: SizedBox(
                              width: 200,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  TextButton(
                                      onPressed: () =>
                                          value.addToFavourite(index),
                                      child: const Text(
                                        'Add',
                                        style: TextStyle(
                                            color: Color(0XFFFF7A00),
                                            fontSize: 25,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400),
                                      )),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        value.deleteFromFavourite(index);
                                      },
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(
                                            color: Color(0XFF0054F8),
                                            fontSize: 25,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400),
                                      )),
                                ],
                              ),
                            )),
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
