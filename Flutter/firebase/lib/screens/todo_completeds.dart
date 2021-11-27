import 'package:firebase/components/header.dart';
import 'package:firebase/components/todo_list.dart';
import 'package:firebase/providers/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompletedTodos extends StatelessWidget {
  const CompletedTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoListProvider>(context).items;
    final avaliableScreen = MediaQuery.of(context).size.height -
        Header().preferredSize.height;

    return SingleChildScrollView(
      child: Container(
        height: avaliableScreen,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: TodoList(
                todoList: todoList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
