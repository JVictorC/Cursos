import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import './screens/categories_meals_screeen.dart';
import './utils/app_router.dart';
import 'screens/tabs_screen.dart';
import './models/meal.dart';
import './data/dummy_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  Settings settings = Settings();
  List<Meal> _favoritesMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterVegan &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _togglesFavorite(Meal meal) {
    setState(() {
      _favoritesMeals.contains(meal)
          ? _favoritesMeals.remove(meal)
          : _favoritesMeals.add(meal);
    });
  }

  bool _isFavorites(Meal meal) {
    return _favoritesMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        colorScheme: const ColorScheme.light()
            .copyWith(primary: Colors.pink, secondary: Colors.amber),
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(
              favoritesMeals: _favoritesMeals,
            ),
        AppRoutes.CATEGORIES: (ctx) => CategoriesMealsScreen(
              meals: _availableMeals,
            ),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(
              onToggleFavorite: _togglesFavorite,
              isFavorites: _isFavorites,
            ),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(
              onSettingChanged: _filterMeals,
              settings: settings,
            ),
      },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (_) => CategoriesScrenn(),
      //   );
      // },
    );
  }
}
