import 'package:flutter/material.dart';
import './questão.dart';
import './respostas.dart';

class Questionario extends StatelessWidget {
  final perguntas;
  final perguntaSelecionada;

  bool get hasSelectedQuestions {
    return perguntaSelecionada < perguntas.length;
  }

  final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  Widget build(BuildContext context) {
    final List<Map<String, Object>> respostas = hasSelectedQuestions
        ? perguntas[perguntaSelecionada].cast()['answers']
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['text'].toString()),
        ...respostas.map((resp) {
          return Respostas(
            resp['text'].toString(),
            () => responder(int.parse(resp['pontuacao'].toString())),
          );
        }).toList()
      ],
    );
  }
}
