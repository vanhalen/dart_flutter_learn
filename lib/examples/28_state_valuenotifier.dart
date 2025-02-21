import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ContadorScreen(),
    );
  }
}

class ContadorScreen extends StatefulWidget {
  const ContadorScreen({super.key});

  @override
  ContadorScreenState createState() => ContadorScreenState();
}

class ContadorScreenState extends State<ContadorScreen> {
  // Definindo um ValueNotifier para gerenciar o estado do contador
  final ValueNotifier<int> _contador = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo de ValueNotifier')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Primeiro widget em uma classe diferente
          ContadorWidget1(contador: _contador),
          const SizedBox(height: 20),
          // Segundo widget em outra classe diferente
          ContadorWidget2(contador: _contador),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _contador.value++, // Incrementa o valor do contador
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Primeira classe de widget
class ContadorWidget1 extends StatelessWidget {
  final ValueNotifier<int> contador;

  const ContadorWidget1({super.key, required this.contador});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: contador,
      builder: (context, valor, _) {
        return Text(
          'Contador 1: $valor',
          style: const TextStyle(fontSize: 24),
        );
      },
    );
  }
}

// Segunda classe de widget
class ContadorWidget2 extends StatelessWidget {
  final ValueNotifier<int> contador;

  const ContadorWidget2({super.key, required this.contador});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: contador,
      builder: (context, valor, _) {
        return Text(
          'Contador 2: $valor',
          style: const TextStyle(fontSize: 24),
        );
      },
    );
  }
}
