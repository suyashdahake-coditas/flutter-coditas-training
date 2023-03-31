import 'package:flutter/material.dart';
import 'package:social_app/widgets/posts_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 30),
                child: Text(
                  'Photographer Posts',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold),
                ),
              ),
              PostsListView(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.abc_outlined),label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.add),label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.notifications),label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: '')
            ],
            currentIndex: 0,
            unselectedItemColor: Colors.purple,
            selectedItemColor: Colors.purple,
          ),
        ),
      ),
    );
  }
}
