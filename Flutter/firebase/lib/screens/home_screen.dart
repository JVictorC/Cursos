import 'package:firebase/components/form_bar_new_todo.dart';
import 'package:firebase/components/header.dart';
import 'package:firebase/components/todo_list.dart';
import 'package:firebase/providers/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avaliableScreen = MediaQuery.of(context).size.height -
        Header().preferredSize.height;

    return SingleChildScrollView(
      child: RefreshIndicator(
        onRefresh: () async {
          Provider.of<TodoListProvider>(
            context,
            listen: false,
          ).loadedToDos();
        },
        child: Container(
          height: avaliableScreen,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              FormBarNewTodo(),
              FutureBuilder(
                future: Provider.of<TodoListProvider>(
                  context,
                  listen: false,
                ).loadedToDos(),
                builder: (ctx, snapShop) {
                  if (snapShop.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 100),
                        child: const Center(
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    );
                  }
                  return Consumer<TodoListProvider>(
                    builder: (ctx, toDoList, _) {
                      return Expanded(
                        flex: 1,
                        child: TodoList(
                          todoList: toDoList.items,
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
