// Exemplo de Dismissible
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Exemplo de Dismissible')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: DismissibleExemplo(),
        ),
      ),
    );
  }
}

// 🔹 Exemplo de Dismissible
class DismissibleExemplo extends StatefulWidget {
  const DismissibleExemplo({super.key});

  @override
  State<DismissibleExemplo> createState() => _DismissibleExemploState();
}

class _DismissibleExemploState extends State<DismissibleExemplo> {
  List<int> items = List<int>.generate(100, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          // Cor amarela com ícone de arquivar para deslizamento da ESQUERDA para a DIREITA
          background: Container(
            color: Colors.amber,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Icon(Icons.archive_outlined, color: Colors.white),
          ),
          // Cor vermelha com ícone de deletar para deslizamento da DIREITA para a ESQUERDA
          secondaryBackground: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          key: ValueKey<int>(items[index]), // Chave de identificação
          onDismissed: (DismissDirection direction) {
            setState(() {
              items.removeAt(index);
              if (direction == DismissDirection.startToEnd) {
                // ✅ Deslizou da ESQUERDA para a DIREITA (➡️)
                print('Item $index arquivado!');
              } else if (direction == DismissDirection.endToStart) {
                // ❌ Deslizou da DIREITA para a ESQUERDA (⬅️)
                print('Item $index excluído!');
              }
            });
          },
          child: ListTile(
            title: Text(
              'Item ${items[index]}',
            ),
          ),
        );
      },
    );
  }
}
