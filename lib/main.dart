import 'package:flutter/material.dart';
import 'package:navegando_entre_telas/data/dummy_data.dart';
import 'package:navegando_entre_telas/screens/meal_detail_screen.dart';
import 'package:navegando_entre_telas/screens/settings_screen.dart';
import 'package:navegando_entre_telas/screens/tabs_screen.dart';
import 'package:navegando_entre_telas/utils/app_routes.dart';
import 'screens/categories_meals_screen.dart';
import 'package:navegando_entre_telas/models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _avaliableMeals = dummyMeals;

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
        AppRoutes.HOME: (context) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (context) =>
            CategoriesMealsScreen(_avaliableMeals),
        AppRoutes.MEAL_DETAIL: (context) => const MealDetailScreen(),
        AppRoutes.SETTINGS: (context) => const SettingsScreen(),
      },
    );
  }
}
