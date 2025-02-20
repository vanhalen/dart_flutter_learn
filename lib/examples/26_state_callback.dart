import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

// ###
// ### ↓↓↓ Exemplos - Início ↓↓↓
// ###

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState(); // Criando o estado
}

class _HomeScreenState extends State<HomeScreen> {
  int _contador = 0;

  // 🔹 Callback para receber o valor do widget filho
  void _atualizarContador(int novoValor) {
    setState(() {
      _contador = novoValor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo de Callback')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 Passa o callback para o widget filho
            MyCounter(onChanged: _atualizarContador),
            const SizedBox(height: 20),
            Text(
              'Valor do Contador (Pai): $_contador',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔹 Widget filho que notifica o pai sobre mudanças
class MyCounter extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const MyCounter({super.key, required this.onChanged});

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int _count = 0;

  void _incrementar() {
    setState(() {
      _count++;
      widget.onChanged(_count); // 🔹 Notifica o pai com o novo valor
    });
  }

  void _decrementar() {
    setState(() {
      _count--;
      widget.onChanged(_count); // 🔹 Notifica o pai com o novo valor
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _incrementar,
          child: const Text('+'),
        ),
        ElevatedButton(
          onPressed: _decrementar,
          child: const Text('-'),
        ),
        const SizedBox(height: 10),
        Text(
          'Contador Local (Filho): $_count',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// ###
// ### ↑↑↑ Exemplos - Fim ↑↑↑
// ###
