// Exemplo de Row e Column

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ###
              // ### ↓↓↓ Exemplos - Início ↓↓↓
              // ###

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround, // Distribui os itens
                children: [
                  Icon(Icons.star, size: 40, color: Colors.blue),
                  Icon(Icons.favorite, size: 40, color: Colors.red),
                  Icon(Icons.thumb_up, size: 40, color: Colors.green),
                ],
              ),

              Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centraliza na tela
                children: [
                  Text("Linha 1", style: TextStyle(fontSize: 24)),
                  Text("Linha 2", style: TextStyle(fontSize: 24)),
                  Text("Linha 3", style: TextStyle(fontSize: 24)),
                ],
              ),

              // ###
              // ### ↑↑↑ Exemplos - Fim ↑↑↑
              // ###
            ],
          ),
        ),
      ),
    );
  }
}
