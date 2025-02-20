import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0; // 🔹 Estado do contador no widget pai

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Prop Drilling Example')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 Passando o estado para widgets filhos
            MyCounter(count: count),

            // 🔹 O botão altera o estado no widget pai
            ElevatedButton(
              onPressed: increment,
              child: const Text('Incrementar'),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔹 Widget que recebe o estado através do construtor
class MyCounter extends StatelessWidget {
  final int count;

  const MyCounter({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Contador: $count',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
