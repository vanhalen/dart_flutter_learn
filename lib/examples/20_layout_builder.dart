import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Exemplo de Builder')),
        body: Center(
          child: ExemploBuilder(),
        ),
      ),
    );
  }
}

// ###
// ### ↓↓↓ Exemplos - Início ↓↓↓
// ###

class ExemploBuilder extends StatelessWidget {
  const ExemploBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ElevatedButton(
          onPressed: () {
            // É necessário passar o context para apresentar o snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Botão pressionado!')),
            );
          },
          child: Text('Mostrar Snackbar'),
        );
      },
    );
  }
}

// ###
// ### ↑↑↑ Exemplos - Fim ↑↑↑
// ###
