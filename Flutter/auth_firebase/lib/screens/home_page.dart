import 'package:auth_firebase/components/app_drawer.dart';
import 'package:auth_firebase/screens/conversao_page.dart';
import 'package:auth_firebase/screens/main_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectScreen = 0;


  final List<Widget> _avaliableScreens = [const MainPage(), const ConversaoPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _avaliableScreens[_selectScreen],
      drawer: const AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Conversão'
          ),
        ],
        currentIndex: _selectScreen,
        onTap: (index) => setState(() => _selectScreen = index),
        type: BottomNavigationBarType.shifting,
        fixedColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        selectedFontSize: 15,
        iconSize: 25,
      ),
    );
  }
}
