import 'package:flutter/material.dart';
import 'package:todo_list/components/wecolme.dart';
import './models/item_todo.dart';

main() => runApp(const ToDoList());

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      title: 'ToDo List',
      theme: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.blue[600],
          secondary: Colors.grey[800],
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 45,
              color: Colors.grey[800],
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ItemToDo> _toDoList = [];

  @override
  Widget build(BuildContext context) {



    final _appBar = AppBar(
      title: const Text('ToDo-List'),
    );

    final _avaliableHeigth = MediaQuery.of(context).size.height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: _appBar,
      body: const Welcome(),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Icon(Icons.add, size: 35,),
        ),
      ),
    );
  }
}
