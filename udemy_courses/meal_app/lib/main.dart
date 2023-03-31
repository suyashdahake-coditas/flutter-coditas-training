import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

import 'models/meal.dart';
import 'screens/category_meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favouritedMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = dummyMeals.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isMealFavourite(String id) {
    return _favouritedMeals.any((meal) => meal.id == id);
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouritedMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favouritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouritedMeals.add(
          dummyMeals.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          color: Colors.purple, //<-- SEE HERE
        ),
        primaryColor: Colors.purple,
        // accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 255, 255, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodySmall: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            titleMedium: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
                fontSize: 20)),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.purple),
      ),
      // home: const CategoriesScreen(),
      routes: {
        '/': (context) => TabScreen(
              favouriteMeal: _favouritedMeals,
            ),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
              toggleFavourite: _toggleFavourite,
              isFavourite: _isMealFavourite,
            ),
        FilterScreen.routeName: (context) => FilterScreen(
              saveFilters: _setFilters,
              filters: _filters,
            ),
      },
      onGenerateRoute: (settings) {
        // if(settings.name=='/meal-detail'){
        //   return ...;
        // }else if(settings.name=='something-else'){
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (context)=>CategoriesScreen(),);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
