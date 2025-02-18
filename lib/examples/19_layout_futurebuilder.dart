import 'package:flutter/material.dart';
import 'dart:convert'; // Para converter JSON
import 'package:http/http.dart' as http; // Para fazer requisições HTTP

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exemplo de FutureBuilder'),
        ),
        body: Center(
          child: ExemploFutureBuilder(),
        ),
      ),
    );
  }
}

// ###
// ### ↓↓↓ Exemplos - Início ↓↓↓
// ###

class ExemploFutureBuilder extends StatelessWidget {
  const ExemploFutureBuilder({super.key});

  // 🔹 Função que busca os feriados na API
  Future<List<Map<String, dynamic>>> fetchHolidays() async {
    final response = await http.get(
      Uri.parse('https://tools4devs.rodrigorchagas.com.br/api/holidays/2025'),
    );

    if (response.statusCode == 200) {
      // 🔹 Verifica a estrutura correta da resposta
      final dynamic jsonData = json.decode(response.body);

      if (jsonData is Map<String, dynamic>) {
        return jsonData.values
            .whereType<
                Map<String, dynamic>>() // 🔹 Garante que são mapas válidos
            .toList();
      } else {
        throw Exception('Resposta inesperada da API');
      }
    } else {
      throw Exception('Erro ao carregar os feriados');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchHolidays(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // 🔹 Exibe um indicador de carregamento
        } else if (snapshot.hasError) {
          return Text(
              'Erro: ${snapshot.error}'); // 🔹 Exibe erro se a API falhar
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('Nenhum feriado encontrado');
        }

        // 🔹 Exibe os feriados em uma ListView
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final feriado = snapshot.data![index];

            return ListTile(
              title: Text(feriado['name'] ?? 'Sem Nome'), // Nome do feriado
              subtitle: Text(feriado['date'] ?? 'Sem Data'), // Data do feriado
              leading:
                  Icon(Icons.event, color: Colors.blue), // Ícone de calendário
              trailing:
                  Text(feriado['type'] ?? 'Desconhecido'), // Tipo do feriado
            );
          },
        );
      },
    );
  }
}

// ###
// ### ↑↑↑ Exemplos - Fim ↑↑↑
// ###
