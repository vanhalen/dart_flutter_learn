import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'; // Para o Model

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CpfScreen(),
    );
  }
}

// Exemplo de como definir um Model
class CpfData {
  CpfData(this.cpf);

  final String cpf;
}

class CpfModel {
  Future<CpfData> loadCpfFromServer() async {
    final uri =
        Uri.parse('https://tools4devs.rodrigorchagas.com.br/api/generator/cpf');
    final response = await get(uri);

    // Decodificando resposta JSON
    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    // Pegando exatamente a variavel cpf da resposta json
    final String cpf = jsonResponse['cpf'];

    return CpfData(cpf);
  }
}

// Exemplo de como definir um ViewModel
class CpfViewModel extends ChangeNotifier {
  final CpfModel model;

  String? cpf;
  String? errorMessage;

  CpfViewModel(this.model);

  Future<void> init() async {
    try {
      cpf = (await model.loadCpfFromServer()).cpf;
    } catch (e) {
      errorMessage = 'Não foi possível retornar o CPF';
    }

    notifyListeners(); // Notificando mudanças
  }
}

// Definindo a View
class CpfWidget extends StatelessWidget {
  final CpfViewModel viewModel;

  const CpfWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Center(
          child: Column(
            children: [
              if (viewModel.errorMessage != null)
                Text('Erro: ${viewModel.errorMessage}'),
              if (viewModel.cpf != null) Text('CPF: ${viewModel.cpf}'),
              if (viewModel.cpf == null && viewModel.errorMessage == null)
                const CircularProgressIndicator(), // Exibe um indicador de carregamento
            ],
          ),
        );
      },
    );
  }
}

class CpfScreen extends StatefulWidget {
  const CpfScreen({super.key});

  @override
  CpfScreenState createState() => CpfScreenState();
}

class CpfScreenState extends State<CpfScreen> {
  // Instância única do ViewModel
  final CpfViewModel viewModel = CpfViewModel(CpfModel());

  @override
  void initState() {
    super.initState();
    // Inicializa o ViewModel para carregar os dados
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo de MVVM')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Passa o ViewModel para o Widget
          CpfWidget(viewModel: viewModel),
          SizedBox(height: 20),
          // Chamando o viewModel.init para gerar novamente um novo CPF
          ElevatedButton(onPressed: viewModel.init, child: Text('GERAR'))
        ],
      ),
    );
  }
}
