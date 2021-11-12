import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Lista de Tarefas',
          style: Theme.of(context).textTheme.headline1,
        ),
        Image.asset('assets/images/welcome.png')
      ],
    );
  }
}
