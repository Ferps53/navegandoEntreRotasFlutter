import 'package:flutter/material.dart';
import 'package:navegando_entre_telas/data/dummy_data.dart';
import 'package:navegando_entre_telas/models/settings.dart';
import 'package:navegando_entre_telas/screens/meal_detail_screen.dart';
import 'package:navegando_entre_telas/screens/settings_screen.dart';
import 'package:navegando_entre_telas/screens/tabs_screen.dart';
import 'package:navegando_entre_telas/utils/app_routes.dart';
import 'screens/categories_meals_screen.dart';
import 'package:navegando_entre_telas/models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _avaliableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _avaliableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterVegetarian &&
            !filterLactose &&
            !filterVegan;
      }).toList();
    });
  }

  void _toggleMeal(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (context) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (context) =>
            CategoriesMealsScreen(_avaliableMeals),
        AppRoutes.MEAL_DETAIL: (context) =>
            MealDetailScreen(_toggleMeal, isFavorite),
        AppRoutes.SETTINGS: (context) => SettingsScreen(_filterMeals, settings),
      },
    );
  }
}
