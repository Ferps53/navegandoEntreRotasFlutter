import 'package:flutter/material.dart';
import 'package:navegando_entre_telas/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes da Refeição"),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(meal.imageUrl, fit: BoxFit.cover),
          ),
          _createSectionTitle(context, "Ingredientes"),
          Container(
            width: 200,
            height: 250,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
