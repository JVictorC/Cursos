import 'package:firebase/providers/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlertCompletedToDos extends StatefulWidget {
  const AlertCompletedToDos({Key? key}) : super(key: key);

  @override
  _AlertCompletedToDosState createState() => _AlertCompletedToDosState();
}

class _AlertCompletedToDosState extends State<AlertCompletedToDos> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tem certea ?'),
      content: const Text(
          'Caso marque sim o toDo irá ser mandado para a tela de Concluidos'),
      actions: _isLoading
          ? [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: CircularProgressIndicator(),
              ),
            ]
          : [
              TextButton(
                onPressed: () async {
                  setState(() => _isLoading = true);
                  await Provider.of<TodoListProvider>(
                    context,
                    listen: false,
                  ).completedToDos().then((value) {
                    Navigator.of(context).pop();
                    setState(() => _isLoading = false);
                  });
                },
                child: const Text(
                  'Sim',
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Não',
                ),
              ),
            ],
    );
  }
}
