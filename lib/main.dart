import 'package:flutter/material.dart';
import './resultado.dart';
import './Questionario.dart';

main(List<String> args) => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoGlobal = 0;
  final _perguntas = const [
    {
      "Texto": "Comida preferida?",
      "Respostas": [
        {"texto": "Canjica", "nota": 1},
        {"texto": "Lasanha", "nota": 0},
        {"texto": "Strogonoff", "nota": 0},
        {"texto": "Pizza", "nota": 0},
      ],
    },
    {
      "Texto": "Game mais jogado?",
      "Respostas": [
        {"texto": "GTA V", "nota": 0},
        {"texto": "CupHead", "nota": 0},
        {"texto": "League Of Legends", "nota": 1},
        {"texto": "God Of War IV", "nota": 0},
      ],
    },
    {
      "Texto": "Cor favorita?",
      "Respostas": [
        {"texto": "Azul", "nota": 0},
        {"texto": "Vermelho", "nota": 0},
        {"texto": "Amarelo", "nota": 0},
        {"texto": "Preto", "nota": 1},
      ],
    },
    {
      "Texto": "Animal favorito?",
      "Respostas": [
        {"texto": "Coelho", "nota": 0},
        {"texto": "Cachorro", "nota": 1},
        {"texto": "Gato", "nota": 0},
        {"texto": "Papagaio", "nota": 0},
      ]
    },
    {
      "Texto": "Data de aniversário?",
      "Respostas": [
        {"texto": "09/09/94", "nota": 0},
        {"texto": "09/09/93", "nota": 0},
        {"texto": "01/09/94", "nota": 1},
        {"texto": "01/09/93", "nota": 0},
      ]
    },
    {
      "Texto": "Formado em qual curso?",
      "Respostas": [
        {"texto": "Engenharia Mecânica", "nota": 1},
        {"texto": "Computação Gráfica", "nota": 0},
        {"texto": "Engenharia Civil", "nota": 0},
        {"texto": "Ciências da Computação", "nota": 0},
      ]
    }
  ];

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoGlobal = 0;
    });
  }

  void _Responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoGlobal += pontuacao;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Você conhece Wellyson?'),
        ),
        body: _perguntaSelecionada < _perguntas.length
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                Responder: _Responder,
              )
            : Resultado(
                _pontuacaoGlobal, _reiniciarQuestionario, _perguntaSelecionada),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
