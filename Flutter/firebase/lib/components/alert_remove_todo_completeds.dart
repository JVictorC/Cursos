import 'package:firebase/models/todo.dart';
import 'package:firebase/providers/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlertRemoveCompletedTodo extends StatefulWidget {
  final ToDo toDo;
  const AlertRemoveCompletedTodo({Key? key, required this.toDo})
      : super(key: key);

  @override
  _AlertRemoveCompletedTodo createState() => _AlertRemoveCompletedTodo();
}

class _AlertRemoveCompletedTodo extends State<AlertRemoveCompletedTodo> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoListProvider>(context);

    return AlertDialog(
      title: Text(
        'Tem Certeza ?',
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      content: const Text(
        'Caso marque sim, o item voltara a tela inicial, deseja continuar ?',
      ),
      actions: _isLoading
          ? [
             const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 30
                ),
                child: CircularProgressIndicator(),
              )
            ]
          : [
              TextButton(
                onPressed: () async {
                  setState(() => _isLoading = true);
                  await provider.removeTodoCompleted(widget.toDo);
                  Navigator.of(context).pop();
                  setState(() => _isLoading = false);
                },
                child: const Text('SIM'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('NÃO'),
              ),
            ],
    );
  }
}
