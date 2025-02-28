// Exemplos de Checkbox, Switch e Radio
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isChecked = false;
  bool light = true;

  bool cutlery = false;
  bool _volume = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:
            AppBar(title: const Text('Exemplos de Checkbox, Switch e Radio')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Exemplo de Checkbox
              Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.green,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              SizedBox(height: 10),

              // 🔹 Exemplo de Checkbox com Título
              CheckboxListTile(
                title: const Text('Preciso de talheres'),
                secondary: const Icon(Icons.restaurant),
                value: cutlery,
                // Descomente essa linha para o ícone ficar no final
                // controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {
                  setState(() {
                    cutlery = value!;
                  });
                },
              ),
              SizedBox(height: 20),

              // 🔹 Exemplo de Switch
              Switch(
                value: light,
                activeColor: Colors.red,
                onChanged: (bool value) {
                  setState(() {
                    light = value;
                  });
                },
              ),
              SizedBox(height: 10),

              // 🔹 Exemplo de Switch com Título
              SwitchListTile(
                title: const Text('Ativar som'),
                value: _volume,
                onChanged: (bool value) {
                  setState(() {
                    _volume = value;
                  });
                },
                secondary: const Icon(Icons.volume_up),
              ),

              SizedBox(height: 20),
              Text('Escolha uma banda:'),
              // 🔹 Exemplo de Radio
              RadioExemplo(),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔹 Exemplo de Radio
enum Banda { vanhalen, blacksabbath, pinkfloyd, deeppurple }

class RadioExemplo extends StatefulWidget {
  const RadioExemplo({super.key});

  @override
  State<RadioExemplo> createState() => _RadioExemploState();
}

class _RadioExemploState extends State<RadioExemplo> {
  Banda? _banda = Banda.vanhalen;

  void setBanda(Banda? value) {
    setState(() {
      _banda = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Van Halen'),
          leading: Radio<Banda>(
            value: Banda.vanhalen,
            groupValue: _banda,
            onChanged: setBanda,
          ),
        ),
        ListTile(
          title: const Text('Black Sabbath'),
          leading: Radio<Banda>(
            value: Banda.blacksabbath,
            groupValue: _banda,
            onChanged: setBanda,
          ),
        ),
        ListTile(
          title: const Text('Pink Floyd'),
          leading: Radio<Banda>(
            value: Banda.pinkfloyd,
            groupValue: _banda,
            onChanged: setBanda,
          ),
        ),
        ListTile(
          title: const Text('Deep Purple'),
          leading: Radio<Banda>(
            value: Banda.deeppurple,
            groupValue: _banda,
            onChanged: setBanda,
          ),
        ),
      ],
    );
  }
}
