// Exemplo de como passar parâmetros

import 'package:flutter/material.dart';

void main() {
  const int valor = 51; // Parâmetro 1
  const String title = 'Exemplo de parâmetros'; // Parâmetro 2

  runApp(
    const MyApp(
      title: title,
      valor: valor,
    ),
  );
}

class MyApp extends StatelessWidget {
  final String title;
  final int valor;

  const MyApp({super.key, required this.title, required this.valor});

  @override
  Widget build(BuildContext context) {
    final String meuTexto = 'O valor a seguir é passado por parâmetro';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: MeuNovoWidget(
            valor: valor,
            meuTexto: meuTexto,
          ),
        ),
      ),
    );
  }
}

class MeuNovoWidget extends StatelessWidget {
  final int valor;
  final String meuTexto;
  const MeuNovoWidget({super.key, required this.valor, required this.meuTexto});

  @override
  Widget build(BuildContext context) {
    return Text('$meuTexto $valor');
  }
}
