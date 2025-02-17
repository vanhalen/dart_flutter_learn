import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Exemplo de LayoutBuilder")),
        body: LayoutBuilder(
          builder: (context, constraints) {
            // 🔹 Define o layout com base no tamanho da tela
            if (constraints.maxWidth < 600) {
              // 📱 Telas pequenas (Celulares) → Exibe em Coluna
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildBox(Colors.blue, "Celular 1"),
                  SizedBox(height: 10),
                  _buildBox(Colors.green, "Celular 2"),
                ],
              );
            } else {
              // 🖥️ Telas grandes (Tablet/PC) → Exibe em Linha
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildBox(Colors.blue, "Desktop 1"),
                  SizedBox(width: 10),
                  _buildBox(Colors.green, "Desktop 2"),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  // 🔹 Função para criar os blocos coloridos
  Widget _buildBox(Color color, String text) {
    return Container(
      width: 150,
      height: 150,
      color: color,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
