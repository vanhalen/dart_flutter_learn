import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Exemplo de StatelessWidget')),
        body: Center(
          child: ExemploStateless(),
        ),
      ),
    );
  }
}

// ###
// ### ↓↓↓ Exemplos - Início ↓↓↓
// ###

// 🔹 Esse é um Stateless com parâmetros

// Perceba que mesmo utilizando um estado imutável
// podemos criar um widget passando parâmetros fixos,
// você pode conferir isso no widget CardBanda.

// Isso acontece pois não precisamos avisar outros
// widgets para serem reconstruídos, tudo que eu preciso
// é abstrair meu código na montagem do Card.

class ExemploStateless extends StatelessWidget {
  const ExemploStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ListView(
          children: [
            CardBanda(nome: 'Van Halen'),
            CardBanda(nome: 'Pink Floyd', cor: Colors.deepPurple),
            CardBanda(
                nome: 'Poison', cor: const Color.fromARGB(228, 61, 115, 0)),
          ],
        );
      },
    );
  }
}

class CardBanda extends StatelessWidget {
  final String nome;
  final Color cor;

  const CardBanda({
    super.key,
    required this.nome,
    this.cor = const Color.fromARGB(175, 228, 11, 11),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cor,
      child: Center(
        child: SizedBox(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Text(
              nome,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ###
// ### ↑↑↑ Exemplos - Fim ↑↑↑
// ###
