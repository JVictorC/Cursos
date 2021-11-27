import 'package:firebase/providers/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
  final int selectedScreen;
  final void Function(int value) onSeletedScreen;

  const Footer(
      {Key? key, required this.onSeletedScreen, required this.selectedScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoListProvider>(context);

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Concluidos',
          ),
        ],
        currentIndex: selectedScreen,
        onTap: (value) {
          provider.changeScreen(value);
          onSeletedScreen(value); 
        },
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        selectedItemColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
