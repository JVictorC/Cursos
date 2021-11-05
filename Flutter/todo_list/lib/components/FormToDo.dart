import 'package:flutter/material.dart';
import '../models/toDo.dart';

class FormToDo extends StatelessWidget {
  final void Function(String newValue) onSubmit;
  final bool hasEdit;
  final ToDo itemForEdit;

  FormToDo({
    required this.onSubmit,
    required this.hasEdit,
    required this.itemForEdit,
  });

  @override
  Widget build(BuildContext context) {
    final toDocontroller = TextEditingController(
      text: hasEdit ? itemForEdit.toDo : '',
    );

    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        children: [
          TextField(
            controller: toDocontroller,
            decoration: InputDecoration(
                labelText: 'Todo',
                icon: Icon(
                  Icons.addchart_sharp,
                  size: 35,
                  color: Colors.amber,
                )),
            style: TextStyle(fontSize: 25),
            onSubmitted: (_) =>
                onSubmit(toDocontroller.text),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () =>
                  onSubmit(toDocontroller.text),
              child: Icon(Icons.add))
        ],
      ),
    );
  }
}
