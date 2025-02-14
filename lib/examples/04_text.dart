// Exemplos de Text

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Exemplo Completo de Text")),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Alinha os textos à esquerda
            children: [
              // ###
              // ### ↓↓↓ Exemplos - Início ↓↓↓
              // ###

              // 🔹 Texto básico
              Text("Texto simples"),

              SizedBox(height: 10), // Espaçamento entre os textos

              // 🔹 Texto com estilo de fonte
              Text(
                "Texto estilizado",
                style: TextStyle(
                  fontSize: 24, // Tamanho da fonte
                  fontWeight: FontWeight.bold, // Negrito
                  color: Colors.blue, // Cor do texto
                  fontStyle: FontStyle.italic, // Itálico
                  letterSpacing: 2.0, // Espaçamento entre letras
                  wordSpacing: 5.0, // Espaçamento entre palavras
                  decoration: TextDecoration.underline, // Sublinhado
                  decorationColor: Colors.red, // Cor do sublinhado
                  decorationThickness: 2, // Espessura da linha do sublinhado
                ),
              ),

              SizedBox(height: 10),

              // 🔹 Texto com várias linhas e ajuste de tamanho automático
              Text(
                "Este é um texto longo que precisa quebrar em várias linhas automaticamente.",
                maxLines: 2, // Máximo de linhas antes de cortar o texto
                overflow: TextOverflow
                    .ellipsis, // Adiciona "..." se o texto for muito longo
                style: TextStyle(fontSize: 18),
              ),

              SizedBox(height: 10),

              // 🔹 Texto com alinhamento centralizado
              Container(
                color: Colors.grey[200], // Apenas para visualização
                width: double.infinity,
                child: Text(
                  "Texto centralizado",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),

              SizedBox(height: 10),

              // 🔹 Texto justificado
              Container(
                color: Colors.yellow[100],
                padding: EdgeInsets.all(8),
                child: Text(
                  "Este é um texto justificado que se ajusta ao espaço disponível. Isso é útil para parágrafos grandes.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
              ),

              SizedBox(height: 10),

              // 🔹 Texto com RichText para múltiplos estilos
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(text: "Texto com "),
                    TextSpan(
                      text: "estilos diferentes",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    TextSpan(
                      text: " usando RichText.",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // 🔹 Texto com sombra
              Text(
                "Texto com sombra",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 3,
                      color: Colors.black38,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // 🔹 Exemplo de overflow ellipsis (...)
              Container(
                color: Colors.blue,
                width: 90,
                child: Text(
                  "Do tamanho do texto",
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              SizedBox(height: 10),

              // 🔹 Exemplo de overflow fade (...)
              Container(
                color: Colors.orange,
                width: 80,
                child: Text(
                  "Do tamanho do texto",
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                ),
              ),

              SizedBox(height: 10),

              // 🔹 Texto que escala automaticamente com o tamanho do dispositivo
              FittedBox(
                child: Text(
                  "Texto que se adapta ao tamanho do dispositivo",
                  style: TextStyle(fontSize: 50),
                ),
              ),

              // ###
              // ### ↑↑↑ Exemplos - Fim ↑↑↑
              // ###
            ],
          ),
        ),
      ),
    );
  }
}
