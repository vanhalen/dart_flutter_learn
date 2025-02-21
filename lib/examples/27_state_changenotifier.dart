import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        notifier: Contador(), // 🔹 Instancia o ChangeNotifier
        child: const HomeScreen(),
      ),
    );
  }
}

// ###
// ### ↓↓↓ Exemplos - Início ↓↓↓
// ###

// 🔹 ChangeNotifier que guarda o estado global do contador
class Contador extends ChangeNotifier {
  // Dart: O underline nas variáveis significa que ela é privada
  int _valor = 0;

  int get valor => _valor;

  void incrementar() {
    _valor++;
    notifyListeners(); // 🔹 Notifica os ouvintes
  }

  void decrementar() {
    _valor--;
    notifyListeners(); // 🔹 Notifica os ouvintes
  }
}

// 🔹 Classe que fornece o ChangeNotifier para a árvore de widgets
class ChangeNotifierProvider<T extends ChangeNotifier>
    extends InheritedNotifier<T> {
  const ChangeNotifierProvider({
    super.key,
    required super.notifier,
    required super.child,
  });

  static T of<T extends ChangeNotifier>(BuildContext context) {
    final ChangeNotifierProvider<T>? result =
        context.dependOnInheritedWidgetOfExactType<ChangeNotifierProvider<T>>();

    assert(result != null, 'Nenhum $T encontrado no contexto');
    return result!.notifier!;
  }
}

// 🔹 Tela principal que acessa o estado do contador
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contador = ChangeNotifierProvider.of<Contador>(context);

    return Scaffold(
      appBar: AppBar(
        title: ListenableBuilder(
            listenable: contador,
            builder: (context, _) {
              return Text('Contador: ${contador.valor}');
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 Texto que escuta as mudanças no contador
            ListenableBuilder(
              listenable: contador,
              builder: (context, _) {
                return Text(
                  'Valor: ${contador.valor}',
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: contador.incrementar,
                  child: const Text('+'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: contador.decrementar,
                  child: const Text('-'),
                ),
              ],
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
