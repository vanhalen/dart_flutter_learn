import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 🔹 Remove a faixa de debug
      home:
          const ContadorScreen(), // 🔹 Usa o StatefulWidget como tela principal
    );
  }
}

// 🔹 Criando um StatefulWidget para permitir mudanças de estado
class ContadorScreen extends StatefulWidget {
  const ContadorScreen({super.key});

  @override
  State<ContadorScreen> createState() => _ContadorScreenState();
}

class _ContadorScreenState extends State<ContadorScreen> {
  int _contador = 0; // 🔹 Variável para armazenar o contador

  // 🔹 Função para incrementar o contador
  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  // 🔹 Função para diminuir o contador
  void _diminuir() {
    setState(() {
      _contador--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exemplo de StatefulWidget")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // 🔹 Centraliza os itens
            children: [
              Text(
                "Contador: $_contador",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // 🔹 Alinha os botões no centro
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _incrementar,
                    child: const Text('+', style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(width: 10), // 🔹 Espaço entre os botões
                  ElevatedButton(
                    onPressed: _diminuir,
                    child: const Text('-', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
