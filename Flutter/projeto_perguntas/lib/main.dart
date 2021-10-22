import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaAPP());

class PerguntaAPP extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

final _perguntas = const [
  {
    'text': 'Qual é a sua cor favorita ?',
    'answers': [
      {'text': 'Preto', 'pontuacao': 10},
      {'text': 'Vermelho', 'pontuacao': 5},
      {'text': 'Verde', 'pontuacao': 3},
      {'text': 'Branco', 'pontuacao': 1},
    ]
  },
  {
    'text': 'Qual é o seu animal favorito ?',
    'answers': [
      {'text': 'Coelho', 'pontuacao': 10},
      {'text': 'Cobra', 'pontuacao': 5},
      {'text': 'Elefante', 'pontuacao': 3},
      {'text': 'Leão', 'pontuacao': 1},
    ],
  },
  {
    'text': 'Qual é o seu instrutor favorito ?',
    'answers': [
      {'text': 'Leo', 'pontuacao': 10},
      {'text': 'Maria ', 'pontuacao': 5},
      {'text': 'João', 'pontuacao': 3},
      {'text': 'Pedro', 'pontuacao': 1},
    ],
  }
];

class _PerguntaAppState extends State<PerguntaAPP> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  void _responder(int pontuacao) {
    if (hasSelectedQuestions) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _resetForms() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get hasSelectedQuestions {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: hasSelectedQuestions
            ? (Questionario(
                perguntas: _perguntas,
                responder: _responder,
                perguntaSelecionada: _perguntaSelecionada,
              ))
            : Resultado(_pontuacaoTotal, _resetForms),
      ),
    );
  }
}
