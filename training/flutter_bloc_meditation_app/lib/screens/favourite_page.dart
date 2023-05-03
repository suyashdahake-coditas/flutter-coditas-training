import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_meditation_app/bloc/timer_bloc.dart';
import 'package:flutter_bloc_meditation_app/widgets/custom_list_tile.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc,TimerState>(
      builder: (context,state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: state.favouritesData.length,
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
