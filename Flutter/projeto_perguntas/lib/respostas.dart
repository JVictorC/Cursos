import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String textButton;
  final void Function() onSelect;

  Respostas(this.textButton, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelect,
        child: Text(textButton),
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontSize: 28),
          padding: EdgeInsets.all(20),
        ),
      ),
      margin: EdgeInsetsDirectional.all(20),
    );
  }
}
