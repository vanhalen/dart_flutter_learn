import 'dart:async';
import 'dart:convert'; // Para utilização do Map

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// 🔹 1 - Realizando a chamada para a API
Future<Certidao> fetchCertidao() async {
  final response = await http.get(
    Uri.parse(
        'https://tools4devs.rodrigorchagas.com.br/api/generator/certidao'),
  );

  // Validação e retorno
  if (response.statusCode == 200) {
    // 🔹3 -  Convertendo o http.Response para um Certidao
    return Certidao.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Erro ao carregar Album');
  }
}

// 🔹2 -  Classe responsável por converter a resposta JSON
class Certidao {
  final int ano;
  final String uf;
  final String tipo;
  final String certidao;

  const Certidao(
      {required this.ano,
      required this.uf,
      required this.tipo,
      required this.certidao});

  // Utilizando o pattern Factory para conversão
  factory Certidao.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'ano': int ano,
        'uf': String uf,
        'tipo': String tipo,
        'certidao': String certidao
      } =>
        Certidao(
          ano: ano,
          uf: uf,
          tipo: tipo,
          certidao: certidao,
        ),
      _ => throw const FormatException('Erro ao carregar a certidão'),
    };
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Certidao> futureCertidao;

  // 🔹4 -  Buscando os dados com o futureCertidao()
  @override
  void initState() {
    super.initState();
    futureCertidao = fetchCertidao();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Requisição para API (Fetch Data)',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Requisição para API (Fetch Data)')),
        body: Center(
          // 🔹5 -  Exibindo os dados com o FutureBuilder
          child: FutureBuilder<Certidao>(
            future: futureCertidao,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    Divider(height: 20),
                    TextoResposta(
                      titulo: 'Tipo',
                      conteudo: snapshot.data!.tipo,
                    ),
                    Divider(height: 20),
                    TextoResposta(
                      titulo: 'Ano',
                      conteudo: snapshot.data!.ano.toString(),
                    ),
                    Divider(height: 20),
                    TextoResposta(
                      titulo: 'UF',
                      conteudo: snapshot.data!.uf,
                    ),
                    Divider(height: 20),
                    TextoResposta(
                      titulo: 'Documento',
                      conteudo: snapshot.data!.certidao,
                    ),
                    Divider(height: 20),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // Por padrão, coloca uma barra de progresso circular.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

// Um widget apenas para formatar a resposta
class TextoResposta extends StatelessWidget {
  final String titulo;
  final String conteudo;

  const TextoResposta({
    super.key,
    required this.titulo,
    required this.conteudo,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black),
        children: [
          TextSpan(
              text: '$titulo: ',
              style: TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.bold)),
          TextSpan(text: conteudo)
        ],
      ),
    );
  }
}
