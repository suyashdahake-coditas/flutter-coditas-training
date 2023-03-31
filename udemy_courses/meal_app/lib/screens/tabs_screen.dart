import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourite_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;

  const TabScreen({Key? key, required this.favouriteMeal}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late final List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouriteScreen(
          favouriteMeals: widget.favouriteMeal,
        ),
        'title': 'Your Favourite',
      }
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        // type: BottomNavigationBarType.shifting,
        // unselectedItemColor: Colors,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            label: 'Categories',
            icon: const Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            label: 'Favourites',
            icon: const Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
