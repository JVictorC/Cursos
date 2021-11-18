import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import '../models/category.dart';
import '../components/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsScreen({
    Key? key,
    required this.meals
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMelas = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMelas.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: categoryMelas[index]);
        },
      ),
    );
  }
}
