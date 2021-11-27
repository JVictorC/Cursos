import 'package:firebase/components/alert_delete.dart';
import 'package:firebase/components/item_todo.dart';
import 'package:firebase/models/todo.dart';
import 'package:firebase/providers/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  final List<ToDo> todoList;
  const TodoList({
    Key? key,
    required this.todoList,
  }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final providerToDo = Provider.of<TodoListProvider>(context);
    final screSeleted = providerToDo.getScreen;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 100),
      child: ListView.builder(
        itemCount: widget.todoList.length,
        itemBuilder: (ctx, index) {
          final toDo = widget.todoList[index];
          return Dismissible(
            key: Key(toDo.id),
            background: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(15),
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            confirmDismiss: (_) {
              return showDialog<bool>(
                context: context,
                builder: (ctx) {
                  return AlertDelete(toDo: toDo);
                },
              );
            },
            onDismissed: (_) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: const [
                      Icon(Icons.thumb_up, color: Colors.white),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'O item foi removido',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            direction: DismissDirection.endToStart,
            child: ChangeNotifierProvider.value(
              value: toDo,
              child: screSeleted == 0 ? !toDo.isCompleted ? const ItemTodo() : const SizedBox() : toDo.isCompleted ? const ItemTodo() : const SizedBox(),
            ),
          );
        },
      ),
    );
  }
}
