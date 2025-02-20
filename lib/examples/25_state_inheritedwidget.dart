import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String data = 'Estado Inicial'; // 🔹 Estado compartilhado
  int contador = 0; // 🔹 Outro estado compartilhado

  void atualizarTexto() {
    setState(() {
      data = 'Texto Atualizado!'; // 🔹 Altera o texto
    });
  }

  void incrementar() {
    setState(() {
      contador++; // 🔹 Incrementa o contador
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyState(
      data: data,
      contador: contador,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(
          onTextoChange: atualizarTexto,
          onIncrementar: incrementar,
        ),
      ),
    );
  }
}

// ###
// ### ↓↓↓ Exemplos - Início ↓↓↓
// ###

// 🔹 InheritedWidget para compartilhar o estado na árvore de widgets
class MyState extends InheritedWidget {
  final String data;
  final int contador;

  const MyState({
    super.key,
    required this.data,
    required this.contador,
    required super.child,
  });

  // 🔹 Método para acessar o estado no contexto atual
  static MyState of(BuildContext context) {
    final MyState? result =
        context.dependOnInheritedWidgetOfExactType<MyState>();

    assert(result != null, 'Nenhum MyState encontrado no contexto');
    return result!;
  }

  // 🔹 Atualiza os filhos apenas se os dados mudarem
  @override
  bool updateShouldNotify(MyState oldWidget) {
    return data != oldWidget.data || contador != oldWidget.contador;
  }
}

// 🔹 Tela principal que acessa o estado compartilhado
class HomeScreen extends StatelessWidget {
  final VoidCallback onTextoChange;
  final VoidCallback onIncrementar;

  const HomeScreen({
    super.key,
    required this.onTextoChange,
    required this.onIncrementar,
  });

  @override
  Widget build(BuildContext context) {
    var estado = MyState.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("InheritedWidget com Estado Dinâmico")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              estado.data,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              "Contador: ${estado.contador}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onTextoChange,
              child: const Text("Atualizar Texto"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: onIncrementar,
              child: const Text("Incrementar Contador"),
            ),
          ],
        ),
      ),
    );
  }
}

// ###
// ### ↑↑↑ Exemplos - Fim ↑↑↑
// ###
