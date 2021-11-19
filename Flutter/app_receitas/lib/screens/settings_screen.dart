// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final void Function(Settings) onSettingChanged;
  Settings settings = Settings();

  SettingsScreen({
    Key? key,
    required this.onSettingChanged,
    required this.settings
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  Settings settings = Settings();

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }
  

  Widget _createSwitch(
    String title,
    String subTitle,
    bool value,
    void Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        drawer: const Drawer(
          child: MainDrawer(),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Configuração',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                    'Sem Glutén',
                    'Só exibe refeições sem glúten',
                    settings.isGlutenFree,
                    (value) => setState(() {
                      settings.isGlutenFree = value;
                    }),
                  ),
                  _createSwitch(
                    'Sem Lactose',
                    'Só exibe refeições sem Lactose',
                    settings.isLactoseFree,
                    (value) => setState(() {
                      settings.isLactoseFree = value;
                    }),
                  ),
                  _createSwitch(
                    'Vegana',
                    'Só exibe refeições veganas',
                    settings.isVegan,
                    (value) => setState(() {
                      settings.isVegan = value;
                    }),
                  ),
                  _createSwitch(
                    'Vegerariana',
                    'Só exibe refeições vegetarianas',
                    settings.isVegetarian,
                    (value) => setState(() {
                      settings.isVegetarian = value;
                    }),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
