import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/timer_providers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Center(
              child: Text(
                value.getTimerText(),
                style:
                    const TextStyle(fontSize: 90, fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(height: 60),
            GestureDetector(
              onTap: value.timerStarted ? value.stopTimer : value.startTimer,
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color(0XFFFF7A00),
                    borderRadius: BorderRadius.circular(10)),
                child: value.timerStarted
                    ? const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                        child: Text(
                          'Stop',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              color: Colors.white),
                        ),
                      )
                    : const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                        child: Text(
                          'Start',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              color: Colors.white),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              color: Colors.white,
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: value.stopwatchData.length,
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
                        // CustomListTile(
                        //   title: value.stopwatchData.isEmpty,
                        //   stopwatchData: value.stopwatchData[index],
                        //   addHandler:value.addToFavourite,
                        //   deleteHandler: value.deleteFromFavourite,
                        // ),
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
