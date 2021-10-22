import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int potuacaoTotal;
  final void Function() restForm;

  Resultado(this.potuacaoTotal, this.restForm);

  String get fraseResultado {
    if (potuacaoTotal < 8) {
      return 'Parabens !';
    } else if (potuacaoTotal < 12) {
      return 'Você é Bom!';
    } else if (potuacaoTotal < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi';
    }
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: restForm,
            child: Text(
              'Reiniciar',
              style: TextStyle(color: Colors.blue),
            ),
            style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 28),
                padding: EdgeInsets.all(15),
                primary: Colors.transparent,
                shadowColor: Colors.transparent),
          )
        ],
      ),
    );
  }
}
