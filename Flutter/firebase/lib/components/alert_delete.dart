import 'package:firebase/models/todo.dart';
import 'package:firebase/providers/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlertDelete extends StatefulWidget {
  final ToDo toDo;

  const AlertDelete({Key? key, required this.toDo}) : super(key: key);

  @override
  _AlertDeleteState createState() => _AlertDeleteState();
}

class _AlertDeleteState extends State<AlertDelete> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final providerToDo = Provider.of<TodoListProvider>(context);

    return AlertDialog(
      title: Text(
        'Tem Certeza ?',
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      content: const Text(
        'Se sua Resposta for sim o item será Excluido da lista',
      ),
      actions: _isLoading
          ? [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: CircularProgressIndicator(),
              ),
            ]
          : [
              TextButton(
                onPressed: () async {
                  setState(() => _isLoading = true);
                  await providerToDo.removeTodo(widget.toDo.id);
                  Navigator.of(context).pop(true);
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
