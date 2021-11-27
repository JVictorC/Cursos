import 'package:firebase/components/footer.dart';
import 'package:firebase/components/header.dart';
import 'package:firebase/screens/home_screen.dart';
import 'package:firebase/screens/todo_completeds.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedScreen = 0;

  final List<String> _avaliableTitle = ['Home', 'Tarefas Concluidas'];

  final List<Widget> _avaliableScreens = [
    const HomeScreen(),
    const CompletedTodos()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(title: _avaliableTitle[_selectedScreen]),
      body: _avaliableScreens[_selectedScreen],
      bottomNavigationBar: Footer(
        onSeletedScreen: (value) => setState(() => _selectedScreen = value),
        selectedScreen: _selectedScreen,
      ),
    );
  }
}
