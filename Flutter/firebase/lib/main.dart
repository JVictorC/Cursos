import 'package:firebase/providers/todo_list_provider.dart';
import 'package:firebase/screens/tab_bar_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() => runApp(const MyTodoList());


class MyTodoList extends StatelessWidget {
  const MyTodoList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TodoListProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          colorScheme: ThemeData.light().colorScheme.copyWith(
            primary: Colors.deepOrange,
            secondary: Colors.orange[700]
          )
        ),
        debugShowCheckedModeBanner: false,
        home: const TabBarScreen(),
      ),
    );
  }
}
