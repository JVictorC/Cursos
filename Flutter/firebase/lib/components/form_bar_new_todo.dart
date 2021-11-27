import 'package:firebase/providers/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormBarNewTodo extends StatefulWidget {
  FormBarNewTodo({Key? key}) : super(key: key);

  @override
  State<FormBarNewTodo> createState() => _FormBarNewTodoState();
}

class _FormBarNewTodoState extends State<FormBarNewTodo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final Map<String, String> _formDate = {};

  void _submitedForm(BuildContext context) async {
    _formKey.currentState?.validate();
    _formKey.currentState?.save();
    _formKey.currentState?.reset();
    FocusScope.of(context).unfocus();
    setState(() => _isLoading = true );
    await Provider.of<TodoListProvider>(context, listen: false).addNewTodo(_formDate);
    setState(() => _isLoading = false );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextFormField(
              decoration: const InputDecoration(
                label: Text('Digite uma tarefa'),
              ),
              validator: (value) {
                final _toDo = value ?? '';
                if (_toDo.trim().isEmpty) {
                  return 'O campo não pode ser Vazio';
                }
              },
              keyboardType: TextInputType.multiline,
              maxLength: 100,
              maxLines: 3,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _submitedForm(context),
              onSaved: (newtoDo) {
                _formDate['toDo'] = newtoDo ?? '';
              },
            ),
          ),
          TextButton(
            onPressed: () => _submitedForm(context),
            child: _isLoading ? CircularProgressIndicator() : Text('ADICIONAR'),
          )
        ],
      ),
    );
  }
}
