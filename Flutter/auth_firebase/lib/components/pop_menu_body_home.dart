import 'package:flutter/material.dart';

enum PopItem {
  edit,
  delete,
}

class PopMenuHomePage extends StatelessWidget {
  const PopMenuHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (selectValue) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<PopItem>>[
        PopupMenuItem<PopItem>(
          value: PopItem.edit,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.edit),
              SizedBox(
                width: 20,
              ),
              Text('Editar')
            ],
          ),
        ),
        PopupMenuItem<PopItem>(
          value: PopItem.delete,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.delete),
              SizedBox(
                width: 20,
              ),
              Text('Remove')
            ],
          ),
        ),
      ],
    );
  }
}
