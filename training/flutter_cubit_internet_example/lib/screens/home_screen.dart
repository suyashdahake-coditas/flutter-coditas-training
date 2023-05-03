import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_internet_example/cubit/internet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Internet Connected!'),
                  backgroundColor: Colors.green,
                ));
              } else if (state is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Internet Not Connected'),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              if (state is InternetGainedState) {
                return const Text('Connected');
              } else if (state is InternetLostState) {
                return const Text('Not Connected!');
              } else {
                return const Text('Loading...');
              }
            },
          ),
        ),
      ),
    );
  }
}
