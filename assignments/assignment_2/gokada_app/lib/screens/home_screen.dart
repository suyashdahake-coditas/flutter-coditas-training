import 'package:flutter/material.dart';
import 'package:gokada_app/dummyData.dart';
import 'package:gokada_app/screens/second_screen.dart';
import 'package:gokada_app/widgets/custom_list_view.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: SizedBox(
          height: 40,
          child: Image.asset('assets/images/gokada_icon.png'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 15,
              child: Image.asset('assets/images/search.png'),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Delivery To ",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Actor',
                        color: const Color(0XFF000000).withOpacity(0.5)),
                  ),
                  IconButton(
                    color: Color(0XFF000000).withOpacity(0.5),
                    icon: Icon(_isExpanded
                        ? Icons.keyboard_arrow_down_sharp
                        : Icons.keyboard_arrow_up_sharp),
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              if (_isExpanded)
                Text(
                  'Mountain View, CA',
                  style: TextStyle(fontSize: 35,color: const Color(0XFF000000).withOpacity(0.5)),
                ),
              const SizedBox(
                height: 50,
              ),
              const Divider(
                height: 3,
                color: Colors.black,
                indent: 3,
                endIndent: 3,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Most Popular',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextButton(
                      child: const Text('View all'),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              CustomListView(data: mostPopularDummyData),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Most Popular',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextButton(
                      child: const Text('View all'),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              CustomListView(data: nearByPopularDummyData),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Best Rated',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextButton(
                      child: const Text('View all'),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              CustomListView(data: bestRatedDummyData),
            ],
          ),
        ),
      ),
    );
  }
}
