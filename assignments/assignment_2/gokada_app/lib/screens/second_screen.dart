import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gokada_app/screens/home_screen.dart';
import 'package:gokada_app/widgets/custom_grid_view.dart';
import 'package:intl/intl.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});

  final DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0XFF00C795).withOpacity(0.85),
              const Color(0XFF00C795).withOpacity(0.68)
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: const Drawer(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: SizedBox(
              height: 30,
              child: Image.asset('assets/images/gokada_icon2.png'),
            ),
            elevation: 0,
            actions: [
              Image.asset(
                'assets/images/qnmark.png',
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Hello, John!",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Actor',
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  DateFormat('EEEE, MMM dd yyyy').format(_currentDate),
                  style: TextStyle(color: const Color(0xFFFFFFFF).withOpacity(0.85),fontFamily: 'Roboto'),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomGridView(),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding:
                        MaterialStateProperty.all(const EdgeInsets.all(8)),
                        // elevation: MaterialStateProperty.all(6),
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0XFF6FDEC2),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
