import 'dart:convert';

import 'package:firebase/models/todo.dart';
import 'package:firebase/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class TodoListProvider extends ChangeNotifier {
  final List<ToDo> _toDoList = [];

  bool _isLoading = false;

  int _screenSeleted = 0;

  List<ToDo> get items => [..._toDoList];

  bool get isLoading => _isLoading;

  int get countItens => [..._toDoList].length;

  int get countItensCompleted {
    final arrayCompleted =
        _toDoList.where((element) => element.isCompleted).toList();
    return arrayCompleted.length;
  }

  int get getScreen => _screenSeleted;

  Future<void> updateToDo(ToDo toDo) async {
    await http.patch(
      Uri.parse('${Constants.baseUrl}/${toDo.id}.json'),
      body: jsonEncode(
        {'date': toDo.date.toIso8601String(), 'toDo': toDo.toDo},
      ),
    );
  }

  Future<void> completedToDos() async {
    _toDoList.forEach(
      (toDo) async {
        await http.patch(
          Uri.parse('${Constants.baseUrl}/${toDo.id}.json'),
          body: jsonEncode(
            {'isCompleted': toDo.isCompleted},
          ),
        );
      },
    );
    notifyListeners();
  }

  Future<void> loadedToDos() async {
    final request = await http.get(
      Uri.parse('${Constants.baseUrl}.json'),
    );

    final Map<String, dynamic> json = jsonDecode(request.body) ?? {};

    _toDoList.clear();
    json.forEach(
      (id, mapTodo) {
        _toDoList.add(
          ToDo(
            id: id,
            toDo: mapTodo['toDo'],
            date: DateTime.parse(mapTodo['date']),
            isCompleted: mapTodo['isCompleted'],
          ),
        );
      },
    );
    notifyListeners();
  }

  Future<void> addNewTodo(Map<String, String> newTodo) async {
    final request = await http.post(
      Uri.parse('${Constants.baseUrl}.json'),
      body: jsonEncode(
        {
          'toDo': newTodo['toDo'],
          'date': DateTime.now().toIso8601String(),
          'isCompleted': false,
        },
      ),
    );
    final id = jsonDecode(request.body)['name'];

    _toDoList.add(
      ToDo(
        id: id,
        toDo: newTodo['toDo']!,
        date: DateTime.now(),
      ),
    );

    notifyListeners();
  }

  Future<void> removeTodoCompleted(ToDo toDo) async {
    final index = _toDoList.indexWhere((element) => element.id == toDo.id);

    await http.patch(
      Uri.parse('${Constants.baseUrl}/${toDo.id}.json'),
      body: jsonEncode(
        {
          'isCompleted': false,
        },
      ),
    );

    toDo.isCompleted = false;
    _toDoList.insert(index, toDo);
    notifyListeners();
  }

  Future<void> removeTodo(String id) async {
    _isLoading = true;
    notifyListeners();
    await http.delete(Uri.parse('${Constants.baseUrl}/$id.json'));
    _toDoList.removeWhere((element) => element.id == id);
    _isLoading = false;
    notifyListeners();
  }

  void changeScreen(int newScreen) {
    _screenSeleted = newScreen;
    notifyListeners();
  }
}
