import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          // Centraliza o conteúdo na tela
          child: CounterWidget(),
        ),
      ),
    );
  }
}

// Widget com estado para gerenciar o contador
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0; // Variável que armazena o valor do contador

  void _incrementCounter() {
    // O setState() informa ao Flutter que o widget deve ser reconstruído
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Centraliza na tela
      children: [
        // Exibe o valor do contador
        Text(
          'Contador: $_counter',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20), // Espaçamento entre os widgets
        // Botão que incrementa o contador
        ElevatedButton(
          onPressed: _incrementCounter,
          child: const Text('Incrementar'),
        ),
      ],
    );
  }
}
