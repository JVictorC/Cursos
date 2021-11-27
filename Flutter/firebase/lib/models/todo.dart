import 'package:flutter/foundation.dart';

class ToDo extends ChangeNotifier {
  final String id;
  String toDo;
  DateTime date;
  bool isCompleted;

  ToDo({
    required this.id,
    required this.toDo,
    required this.date,
    this.isCompleted = false,
  });

  void changeDate(DateTime newDate) {
    date = newDate;
    notifyListeners();
  }

  void changeToDo(String newToDo) {
    toDo = newToDo;
    notifyListeners();
  }

  bool toggleCompleted() {
    isCompleted = !isCompleted;
    notifyListeners();
    return isCompleted;
  }
}
