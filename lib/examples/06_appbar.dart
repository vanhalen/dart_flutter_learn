// Exemplo de uso para o widget AppBar (Barra superior)

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de "Debug"
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ###
      // ### ↓↓↓ Exemplos - Início ↓↓↓
      // ###

      appBar: AppBar(
        title: Text("Exemplo de AppBar"), // 🔹 Título da barra

        // 🔹 Ícone no canto esquerdo (Menu ou Voltar)
        leading: IconButton(
          icon: Icon(Icons.menu), // Ícone do menu
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Menu pressionado")), // Notificação
            );
          },
        ),

        // 🔹 Lista de ícones no canto direito
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Buscar pressionado")),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Notificações pressionado")),
              );
            },
          ),
        ],

        // 🔹 Cor de fundo personalizada
        backgroundColor: Colors.blueAccent,

        // 🔹 Efeito de sombra abaixo da AppBar
        elevation: 4,

        // 🔹 Ícones e título centralizados
        centerTitle: true,

        // 🔹 Adicionando fundo gradiente no AppBar
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple], // Gradiente de fundo
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        // 🔹 Define a altura da AppBar
        toolbarHeight: 70,
      ),

      // ###
      // ### ↑↑↑ Exemplos - Fim ↑↑↑
      // ###
    );
  }
}
