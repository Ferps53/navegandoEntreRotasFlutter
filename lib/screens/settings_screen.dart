import 'package:flutter/material.dart';
import 'package:navegando_entre_telas/models/settings.dart';
import 'package:navegando_entre_telas/widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingChanged;
  final Settings settings;

  const SettingsScreen(this.onSettingChanged, this.settings, {super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingChanged(settings);
      },
      subtitle: Text(subtitle),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text("Configurações"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Congigurações",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch(
                "Sem glútem",
                "Só exibe refeições sem glútem",
                settings.isGlutenFree,
                (value) => setState(
                  () {
                    settings.isGlutenFree = value;
                  },
                ),
              ),
              _createSwitch(
                "Sem lactose",
                "Só exibe refeições sem lactose",
                settings.isLactoseFree,
                (value) => setState(
                  () {
                    settings.isLactoseFree = value;
                  },
                ),
              ),
              _createSwitch(
                "Vegana",
                "Só exibe refeições veganas",
                settings.isVegan,
                (value) => setState(
                  () {
                    settings.isVegan = value;
                  },
                ),
              ),
              _createSwitch(
                "Vegetariana",
                "Só exibe refeições vegetarianas",
                settings.isVegetarian,
                (value) => setState(
                  () {
                    settings.isVegetarian = value;
                  },
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
