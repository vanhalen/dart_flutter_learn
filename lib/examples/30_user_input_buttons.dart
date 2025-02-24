// Exemplo de Botões
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Exemplo de Botões')),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                // ###
                // ### ↓↓↓ Exemplos - Início ↓↓↓
                // ###

                Column(
                  children: [
                    // 🔹 Botão com sombra e elevação. Ideal para dar destaque em layouts planos.
                    ElevatedButton(
                      onPressed: () => print("ElevatedButton!"),
                      child: Text("ElevatedButton"),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Column(
                  children: [
                    // 🔹 Botão preenchido e chamativo. Usado para ações finais importantes, como Salvar ou Confirmar.
                    FilledButton(
                      onPressed: () => print("FilledButton!"),
                      child: Text("FilledButton"),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Column(
                  children: [
                    // 🔹 Meio-termo entre FilledButton e OutlinedButton. Bom para ações secundárias com ênfase moderada.
                    FilledButton.tonal(
                      onPressed: () => print("FilledButton Tonal!"),
                      child: Text("FilledButton Tonal"),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Column(
                  children: [
                    // 🔹 Botão com borda visível. Usado para ações importantes, mas não principais.
                    OutlinedButton(
                      onPressed: () => print("OutlinedButton!"),
                      child: Text("OutlinedButton"),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Column(
                  children: [
                    // 🔹 Texto clicável sem borda. Usado para ações contextuais ou links discretos.
                    TextButton(
                      onPressed: () => print("TextButton!"),
                      child: Text("TextButton"),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Column(
                  children: [
                    // 🔹 Botão com ícone. Ideal para ações rápidas (ex: Compartilhar, Curtir)
                    IconButton(
                      onPressed: () => print("IconButton!"),
                      icon: Icon(Icons.thumb_up_off_alt),
                      autofocus: true,
                      color: Colors.deepPurple,
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Column(
                  children: [
                    // 🔹 Botão flutuante com ícone. Destacado para ação primária na tela (ex: Adicionar item).
                    FloatingActionButton(
                      onPressed: () => print("FloatingActionButton!"),
                      child: Icon(Icons.shopping_cart_checkout),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Column(
                  children: [
                    // 🔹 Para desabilitar um botão retorn "null" no onPressed.
                    FilledButton(
                      onPressed: null,
                      child: Text("Disabled"),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // ###
                // ### ↑↑↑ Exemplos - Fim ↑↑↑
                // ###
              ],
            ),
          ),
        ),
      ),
    );
  }
}
