// Exemplo de uso para o Scaffold

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            Colors.blue, // Define a cor principal do app (Material Design)
      ),
      // ###
      // ### ↓↓↓ Exemplos - Início ↓↓↓
      // ###

      home: Scaffold(
        appBar: AppBar(title: Text("Material Design no Scaffold")),
        body: Center(child: Text("Conteúdo centralizado")),

        // 🔹 Menu lateral no estilo Material
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text("Menu",
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              ListTile(title: Text("Item 1"), onTap: () {}),
              ListTile(title: Text("Item 2"), onTap: () {}),
            ],
          ),
        ),

        // 🔹 Botão flutuante no estilo Material
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),

        // 🔹 Barra inferior (Exemplo de uso para menu)
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text("Barra inferior"),
          ),
        ),
      ),

      // ###
      // ### ↑↑↑ Exemplos - Fim ↑↑↑
      // ###
    );
  }
}
