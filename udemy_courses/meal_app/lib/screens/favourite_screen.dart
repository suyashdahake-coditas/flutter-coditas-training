import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  const FavouriteScreen({Key? key, required this.favouriteMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return const Center(
        child: Text('No Favourite in Your List!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            complexity: favouriteMeals[index].complexity,
            imageUrl: favouriteMeals[index].imageUrl,
            id: favouriteMeals[index].id,
            affordability: favouriteMeals[index].affordability,
            duration: favouriteMeals[index].duration,
            title: favouriteMeals[index].title,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
