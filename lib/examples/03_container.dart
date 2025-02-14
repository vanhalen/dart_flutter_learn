// Exemplo prático de Containers

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // O Container pode ser mutável, então o MaterialApp não deve ser uma constante
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centraliza os containers na tela
            children: [
              // ###
              // ### ↓↓↓ Exemplos - Início ↓↓↓
              // ###

              // 🔹 Container do tamanho do texto
              Container(
                color: Colors.blue,
                child: Text("Do tamanho do texto"),
              ),

              SizedBox(height: 10), // Espaçamento entre os containers

              // 🔹 Container com tamanho fixo (100x100)
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),

              SizedBox(height: 10),

              // 🔹 Container que ocupa o máximo de espaço permitido
              Container(
                width: double.infinity, // Ocupa toda a largura disponível
                height: 50, // Altura fixa
                color: Colors.orange,
                alignment: Alignment
                    .center, // Centraliza o conteúdo dentro do container
                child: Text("Largura máxima"),
              ),

              SizedBox(height: 10),

              // 🔹 Container com tamanho fixo e alinhamento central do texto
              Container(
                width: 300,
                height: 200,
                color: Colors.purple,
                alignment: Alignment.center,
                child: Text("Texto Centralizado",
                    style: TextStyle(color: Colors.white)),
              ),

              SizedBox(height: 10),

              // 🔹 Container com borda preta ao redor do texto
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), // Adiciona uma borda
                ),
                child: Text("Borda preta"),
              ),

              SizedBox(height: 10),

              // 🔹 Container com borda arredondada, sombra e padding
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(12), // Bordas arredondadas
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey.withValues(alpha: 0.5), // Sombra suave
                      spreadRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text("Container com borda e sombra"),
              ),

              SizedBox(height: 10),

              // 🔹 Container com rotação
              Container(
                constraints: BoxConstraints.expand(
                  height:
                      Theme.of(context).textTheme.headlineMedium!.fontSize! *
                              1.1 +
                          50.0,
                  width: 200,
                ),
                color: Colors.green[600],
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(0.2),
                child: Text('Com Rotação',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.white)),
              )

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
