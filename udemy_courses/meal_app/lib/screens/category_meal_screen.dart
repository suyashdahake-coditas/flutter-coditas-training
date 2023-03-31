import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  const CategoryMealsScreen({super.key, required this.availableMeals});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    // final routeArgs =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // categoryTitle = routeArgs['title']!;
    // final categoryId = routeArgs['id'];
    // displayedMeals = dummyMeals
    //     .where((meal) => meal.categories.contains(categoryId))
    //     .toList();
    super.initState();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title']!;
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadedInitData = true;
    }

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Recipes'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            complexity: displayedMeals[index].complexity,
            imageUrl: displayedMeals[index].imageUrl,
            id: displayedMeals[index].id,
            affordability: displayedMeals[index].affordability,
            duration: displayedMeals[index].duration,
            title: displayedMeals[index].title,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
