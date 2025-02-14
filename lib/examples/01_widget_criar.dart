// Exemplo de como criar um Widget

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Widget Padrão do Flutter
      home: Scaffold(
        // Utilizando o Column apenas para encapsular os dois widgets criados
        body: Column(
          children: [
            MeuPrimeiroTexto(), // Puxando aqui
            MeuSegundoTexto(), // e aqui
          ],
        ),
      ),
    );
  }
}

// #####
// Isso é um exemplo apenas para estudo, você pode retornar o texto diretamente
// Mas dá para ter uma ideia de como criar widgets StatelessWidget (imutáveis)
// ####

class MeuPrimeiroTexto extends StatelessWidget {
  const MeuPrimeiroTexto({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('Hello, World!'),
    );
  }
}

class MeuSegundoTexto extends StatelessWidget {
  const MeuSegundoTexto({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('BURN, the World!'),
    );
  }
}
