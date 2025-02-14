// Exemplos de ElevatedButton

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ###
                // ### ↓↓↓ Exemplos - Início ↓↓↓
                // ###

                // 🔹 Botão simples
                ElevatedButton(
                  onPressed: () {
                    print("Botão pressionado!");
                  },
                  child: Text("Clique aqui"),
                ),

                SizedBox(height: 10),

                // 🔹 Botão desabilitado
                ElevatedButton(
                  onPressed: null,
                  child: Text("Desabilitado"),
                ),

                SizedBox(height: 10),

                // 🔹 Botão personalizado
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Cor do botão
                    foregroundColor: Colors.white, // Cor do texto
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(3.7)), // Bordas arredondadas
                  ),
                  child: Text("Personalizado"),
                ),

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
