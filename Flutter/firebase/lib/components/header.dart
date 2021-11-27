import 'package:firebase/components/alert_completed_todos.dart';
import 'package:firebase/providers/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  Header({Key? key, this.title}) : super(key: key);

  Future<bool?> _showDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) {
        return const AlertCompletedToDos();
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoListProvider>(context);

    return AppBar(
      title: Text(title ?? ''),
      actions: title == 'Home'
          ? [
              ElevatedButton.icon(
                onPressed: () => _showDialog(context),
                icon: const Icon(
                  Icons.done_all,
                  color: Colors.white,
                ),
                label: const Text(
                  'Terminar Tarefas',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                ),
              )
            ]
          : [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.done_all_rounded,
                      size: 25,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      provider.countItensCompleted.toString(),
                      style: const TextStyle(fontSize: 25),
                    )
                  ],
                ),
              )
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
