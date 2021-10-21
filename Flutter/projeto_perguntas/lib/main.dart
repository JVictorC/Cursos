import 'package:flutter/material.dart';

main() => runApp(PerguntaAPP());

class PerguntaAppState extends State<PerguntaAPP> {
  var perguntaSelecionada = 0;
  void responder() {
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita ?',
      'Qaul é o seu animal favorito ?',
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(perguntas[perguntaSelecionada]),
              ElevatedButton(onPressed: responder, child: Text('Resposta 1')),
              ElevatedButton(onPressed: responder, child: Text('Resposta 2')),
              ElevatedButton(onPressed: responder, child: Text('Resposta 3'))
            ],
          )),
    );
  }
}

class PerguntaAPP extends StatefulWidget {
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
