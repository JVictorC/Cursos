import 'package:firebase/components/alert_remove_todo_completeds.dart';
import 'package:firebase/components/form_edit_items.dart';
import 'package:firebase/models/todo.dart';
import 'package:firebase/providers/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ItemTodo extends StatelessWidget {
  const ItemTodo({Key? key}) : super(key: key);

  Future<bool?> _alertDialoagCompleted(BuildContext context, ToDo toDo) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertRemoveCompletedTodo(toDo: toDo);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final toDo = Provider.of<ToDo>(context);
    final provider = Provider.of<TodoListProvider>(context);

    return ListTile(
      title: Text(toDo.toDo),
      subtitle: Text(DateFormat('dd/MM/yyyy').format(toDo.date)),
      leading: CircleAvatar(
        child: Icon(
          toDo.isCompleted ? Icons.done_sharp : Icons.close,
          color: Colors.white,
        ),
        backgroundColor: toDo.isCompleted
            ? Colors.green
            : Theme.of(context).colorScheme.primary,
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () async {
                final validation = await showModalBottomSheet<ToDo>(
                  context: context,
                  builder: (ctx) {
                    return ChangeNotifierProvider.value(
                      value: toDo,
                      child: const SizedBox(
                        height: 800,
                        child: FormEditItems(),
                      ),
                    );
                  },
                );
                if (validation != null) {
                  provider.updateToDo(validation);
                }
              },
              icon: const Icon(Icons.edit),
              color: Colors.yellow[700],
            ),
            IconButton(
              onPressed: () async {
                if (provider.getScreen == 1) {
                  await _alertDialoagCompleted(context, toDo) ?? false;
                  return;
                }
                toDo.toggleCompleted();
              },
              icon: Icon(toDo.isCompleted ? Icons.close : Icons.done_sharp),
              color: toDo.isCompleted ? Colors.red : Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
