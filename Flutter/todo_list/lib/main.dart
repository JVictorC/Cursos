import 'dart:math';

import 'package:flutter/material.dart';
import './components/List.dart';
import './models/toDo.dart';
import './components/FormToDo.dart';

main() => runApp(TodoList());

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.amber),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ToDo> _arrayList = [];

  ToDo _infoForEdit = ToDo(id: 0, toDo: '');
  bool _hasEdit = false;


  _editInfos(String newValue) {
      final List<ToDo> arrayFiltered =
          _arrayList.where((element) => element.id != _infoForEdit.id).toList();
      setState(() {
        print(_infoForEdit.toDo);
        _arrayList = arrayFiltered;
        _arrayList.add(ToDo(id: Random().nextInt(100), toDo: newValue));
        _hasEdit = false;
        _infoForEdit.id = 0;
        _infoForEdit.toDo = '';
      });
  }

  _addToDo(String newValue) {
    if (_hasEdit) {
      _editInfos(newValue);
    } else {
      final ToDo newToDo = ToDo(id: Random().nextInt(100), toDo: newValue);
      setState(() {
        _arrayList.add(newToDo);
      });
    }
    Navigator.of(context).pop();
  }

  _removeToDo(int idForRemove) {
    final List<ToDo> arrayFiltered =
        _arrayList.where((element) => element.id != idForRemove).toList();
    setState(() {
      _arrayList = arrayFiltered;
    });
  }

  _showInfoForEdit(ToDo toDoForEdit) {
    _openModal();
    setState(() {
      _infoForEdit.toDo = toDoForEdit.toDo;
      _infoForEdit.id = toDoForEdit.id;
      _hasEdit = true;
    });
    // Navigator.of(context).pop();
  }

  _openModal() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return FormToDo(
          onSubmit: _addToDo,
          hasEdit: _hasEdit,
          itemForEdit: _infoForEdit,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text('ToDo-List'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: IconButton(
                onPressed: _openModal,
                icon: Icon(
                  Icons.add,
                  size: 35,
                )),
          )
        ],
      ),
      body: ListForToDo(
        arrayList: _arrayList,
        onEdit: _showInfoForEdit,
        onDelete: _removeToDo,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: _openModal,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
