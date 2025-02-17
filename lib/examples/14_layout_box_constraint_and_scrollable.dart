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

          // O Column é um widget com restrições de tamanho
          // Saiba mais aqui: https://www.youtube.com/watch?v=jckqXR5CrPI&ab_channel=Flutter
          child: Column(
            children: [
              Text(
                'Esse é o PRIMEIRO filho.',
                style: TextStyle(backgroundColor: Colors.red),
              ),

              // O SizeBox é para uma lista controlada,
              // ou seja, vocẽ sabe exatamente o tamanho.
              // Encapsulando o ListView dentro dele, você
              // dará espaço para os outros filhos.
              SizedBox(
                height: 50,
                child: ListView(
                  children: [
                    Text('SEGUNDO Filho ListView (SizedBox).',
                        style: TextStyle(backgroundColor: Colors.green)),
                    Text('Linha 2'),
                    Text('Linha 3'),
                    Text('Linha 4'),
                    Text('Linha 5'),
                    Text('Linha 6'),
                  ],
                ),
              ),

              // O Expanded deve ser utilizado para dizer explicidamente
              // que a lista deve ocupar todo o espaço no pai dando espaço
              // também para os outros filhos, caso contrário você
              // terá um erro
              Expanded(
                child: ListView(
                  children: [
                    Text('TERCEIRO filho ListView (Expanded).',
                        style: TextStyle(backgroundColor: Colors.blue)),
                    Text('Também é um ListView'),
                    Text('E ocupa todo o espaço'),
                    Text('necessário'),
                    Text('Não tendo'),
                    Text('um limite'),
                    Text('...'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
