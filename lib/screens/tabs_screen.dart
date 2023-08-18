import 'package:flutter/material.dart';
import 'package:navegando_entre_telas/screens/categories_screen.dart';
import 'package:navegando_entre_telas/screens/favorite_screen.dart';
import 'package:navegando_entre_telas/widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;

  const TabsScreen(this._favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late final List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Bora Cozinhar?', 'screen': const CategoriesScreen()},
      {'title': 'Favoritos', 'screen': FavoriteScreen(widget._favoriteMeals)},
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _screens[_selectedScreenIndex]['title'] as String,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).indicatorColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).hintColor,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categorias",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favoritos",
          ),
        ],
      ),
    );
  }
}
