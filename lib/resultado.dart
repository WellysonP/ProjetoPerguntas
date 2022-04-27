import 'package:flutter/material.dart';
import 'Questionario.dart';

class Resultado extends StatelessWidget {
  final int perguntaSelecionada;
  final int pontuacao;
  final void Function() reiniciarQuestionario;
  Resultado(
    this.pontuacao,
    this.reiniciarQuestionario,
    this.perguntaSelecionada,
  );

  String get fraseFinal {
    if (pontuacao / perguntaSelecionada * 100 <= 25) {
      return "Não me conhece nada";
    } else if (pontuacao / perguntaSelecionada * 100 <= 50) {
      return "Conhece \"de vista\"";
    } else if (pontuacao / perguntaSelecionada * 100 <= 75) {
      return "Conhece um pouquinho";
    } else {
      return "Conhece muito";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseFinal,
            style: TextStyle(fontSize: 30),
          ),
        ),
        RaisedButton(
          onPressed: reiniciarQuestionario,
          child: Text(
            "Reiniciar",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
