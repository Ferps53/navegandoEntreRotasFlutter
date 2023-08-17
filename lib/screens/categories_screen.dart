import 'package:flutter/material.dart';
import 'package:navegando_entre_telas/data/dummy_data.dart';
import 'package:navegando_entre_telas/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Bora cozinhar?",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES.map((cat) {
          return CategioryItem(cat);
        }).toList(),
      ),
    );
  }
}
