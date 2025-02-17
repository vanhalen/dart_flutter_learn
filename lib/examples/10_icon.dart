// Exemplo do widget Icon
// Acesse a base de ícones por esse link: https://fonts.google.com/icons

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContadorScreen(), // 🔹 Usa o StatefulWidget como tela principal
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
  int _contador = 0; // 🔹 Variável do contador

  void _incrementar() {
    setState(() {
      _contador++; // 🔹 Atualiza o estado para mais
    });
  }

  void _diminuir() {
    setState(() {
      _contador--; // 🔹 Atualiza o estado para menos
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exemplo de Ícones")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              // ###
              // ### ↓↓↓ Exemplos - Início ↓↓↓
              // ###

              // 🔹 Icon - Não possui ação
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 24.0,
                    semanticLabel: 'Texto utilizado para o modo acessibilidade',
                  ),
                  Icon(Icons.audiotrack, color: Colors.green, size: 30.0),
                  Icon(Icons.beach_access, color: Colors.blue, size: 36.0),
                ],
              ),

              SizedBox(height: 20),

              // 🔹 IconButton - Com ação
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Ícone desativado
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.description_outlined),
                  ),

                  // Ícone com ação
                  IconButton(
                    icon: Icon(Icons.plus_one),
                    color: Colors.green,
                    tooltip: 'Clique para acrescentar',
                    onPressed:
                        _incrementar, // 🔹 Chama a função que altera o contador
                  ),

                  // Ícone com fundo colorido
                  Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.red,
                      shape: CircleBorder(), // Borda arredondada
                    ),
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.remove),
                      onPressed: _diminuir,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Text(
                "Contador: $_contador",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20),

              // Icone com Imagem
              Image.asset(
                'assets/images/image_4.png',
                width: 32, // 🔹 Define a largura
                height: 32, // 🔹 Define a altura
                fit: BoxFit.cover, // 🔹 Ajusta a imagem ao espaço disponível
              )

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
