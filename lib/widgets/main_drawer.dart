import 'package:flutter/material.dart';
import 'package:navegando_entre_telas/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.amber,
            child: const Text(
              "Bora Cozinhar",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _createItem(Icons.restaurant, "Refeições",
              () => Navigator.of(context).pushNamed(AppRoutes.HOME)),
          _createItem(Icons.settings, "Configurações",
              () => Navigator.of(context).pushNamed(AppRoutes.SETTINGS)),
        ],
      ),
    );
  }
}
