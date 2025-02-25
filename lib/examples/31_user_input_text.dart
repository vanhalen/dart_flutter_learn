// Exemplo de Textos
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Adicionando o _controller para iniciar um valor padrão no campo
  String textoDoCampo = 'Eddie';
  bool finalizado = false;
  late final TextEditingController _controller;
  final TextEditingController _controller2 =
      TextEditingController(text: 'Campo readonly');

  // Setando o estado inicial do controller
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: textoDoCampo);
  }

  void _clearTextField() {
    _controller.clear(); // Limpa o campo de texto

    setState(() {
      //  Para esse tipo de caso específico deve ser resetado manualmente
      textoDoCampo = '';
      finalizado = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Exemplo de Textos')),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                // ###
                // ### ↓↓↓ Exemplos - Início ↓↓↓
                // ###

                Column(
                  children: [
                    // 🔹 Texto Selecionável
                    SelectableText('''
Esse Texto pode ser selecionado
e copiado. Possui 3 aspas simples
pois comporta últiplas quebras
de linhas
                    '''),
                  ],
                ),
                SizedBox(height: 20),

                Column(
                  children: [
                    // 🔹 Exemplo de texto contínuo contendo vários estilos
                    RichText(
                      text: TextSpan(
                        text: 'Olá ',
                        style: TextStyle(color: Colors.blueAccent),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'tudo',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.deepOrange,
                              )),
                          TextSpan(
                            text: ' certo?',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),

                Column(
                  children: [
                    // 🔹 Campo de texto
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Digite seu Nome',
                      ),
                      onChanged: (value) {
                        setState(() {
                          // Setando o valor toda vez q é editado
                          // Utilizando o trim() apenas para remover os espaços
                          textoDoCampo = value.trim();
                        });
                      },
                      onSubmitted: (value) {
                        setState(() {
                          finalizado = true;
                        });
                      },
                    ),
                    IconButton(
                        onPressed: _clearTextField, icon: Icon(Icons.clear))
                  ],
                ),
                SizedBox(height: 20),

                Column(
                  children: [Text('Nome: $textoDoCampo')],
                ),
                Column(
                  children: [
                    Text('Finalizado?: ${finalizado ? 'Sim' : 'Não'}')
                  ],
                ),

                SizedBox(height: 20),

                // 🔹 Campo readOnly
                Column(
                  children: [
                    TextField(
                      controller: _controller2,
                      readOnly: true,
                    ),
                  ],
                ),

                // 🔹 Campo de Senha (obscureText)
                Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Digite sua Senha',
                      ),
                      obscureText: true,
                    ),
                  ],
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
