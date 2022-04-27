import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) Responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.Responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()["Respostas"]
        : [];
    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]["Texto"].toString()),
        ...respostas
            .map((resp) => Respostas(
                resp["texto"].toString(),
                () => Responder(int.parse(
                      resp["nota"].toString(),
                    ))))
            .toList(),
      ],
    );
  }
}
