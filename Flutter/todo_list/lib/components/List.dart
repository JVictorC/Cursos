import 'package:flutter/material.dart';
import '../models/toDo.dart';

class ListForToDo extends StatelessWidget {
  final List<ToDo> arrayList;
  final void Function(ToDo idForRemove) onEdit;
  final void Function(int idForRemove) onDelete;

  ListForToDo({
    required this.arrayList,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: ListView.builder(
          itemCount: arrayList.length,
          itemBuilder: (ctx, index) {
            final item = arrayList[index];
            return Container(
              height: 150,
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.toDo,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => onDelete(item.id),
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                          iconSize: 30,
                        ),
                        IconButton(
                          onPressed: () => onEdit(item),
                          icon: Icon(Icons.edit),
                          color: Colors.amber,
                          iconSize: 30,
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
