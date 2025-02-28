// Exemplos de Slider
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _currentVolume1 = 1;
  double _currentVolume2 = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Exemplos de Slider')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Exemplo de Slider Simples
              Slider(
                value: _currentVolume1,
                max: 10,
                label: _currentVolume1.toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentVolume1 = value;
                  });
                },
              ),
              // 🔹 Exemplo de Slider com divisions
              Slider(
                value: _currentVolume2,
                max: 5,
                divisions: 10,
                label: _currentVolume2.toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentVolume2 = value;
                  });
                },
                thumbColor: Colors.green,
                inactiveColor: Colors.greenAccent,
                activeColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
