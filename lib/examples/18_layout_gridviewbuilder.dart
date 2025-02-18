// Exemplo de uso para o GridView.builder

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exemplo de GridView.builder'),
        ),
        body: Center(
          child: ExemploGridBuilder(),
        ),
      ),
    );
  }
}

// ###
// ### ↓↓↓ Exemplos - Início ↓↓↓
// ###

class ExemploGridBuilder extends StatelessWidget {
  const ExemploGridBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 🔹 Define o número de colunas no grid
        crossAxisSpacing: 10, // 🔹 Espaçamento horizontal entre os itens
        mainAxisSpacing: 10, // 🔹 Espaçamento vertical entre os itens
      ),
      itemCount: 20, // 🔹 Número total de itens
      itemBuilder: (context, index) {
        return Image(image: AssetImage('assets/images/image_2.jpg'));
      },
    );
  }
}

// ###
// ### ↑↑↑ Exemplos - Fim ↑↑↑
// ###
