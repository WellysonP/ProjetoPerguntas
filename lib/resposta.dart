import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String texto;
  final void Function() onSelect;
  Respostas(this.texto, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blueGrey,
        child: Text(
          texto,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        onPressed: onSelect,
      ),
    );
  }
}
