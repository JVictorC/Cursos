import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritesMeals;
  const FavoriteScreen({Key? key, required this.favoritesMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return const Text('Nenhuma refeição foi marcada como favorita');
    }
    return ListView.builder(
      itemCount: favoritesMeals.length,
      itemBuilder: (ctx, index) {
        final meal = favoritesMeals[index];
        return MealItem(meal: meal);
      },
    );
  }
}
