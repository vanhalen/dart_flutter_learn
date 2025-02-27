// Exemplos de Chip
import 'package:flutter/material.dart';

enum Calendar { day, week, month, year }

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    // const styleTitle =
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Exemplos de Chip')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TituloChip(titulo: 'Chip'),
              SizedBox(height: 10),
              ChipBasico(),
              SizedBox(height: 50),
              TituloChip(titulo: 'InputChip'),
              SizedBox(height: 10),
              InputChipExemplo(),
              SizedBox(height: 50),
              TituloChip(titulo: 'ChoiceChip'),
              SizedBox(height: 10),
              ChoiceChipExemplo(),
              SizedBox(height: 50),
              TituloChip(titulo: 'FilterChip'),
              SizedBox(height: 10),
              FilterChipExemplo(),
              SizedBox(height: 50),
              TituloChip(titulo: 'ActionChip'),
              SizedBox(height: 10),
              ActionChipExemplo(),
            ],
          ),
        ),
      ),
    );
  }
}

class TituloChip extends StatelessWidget {
  final String titulo;

  const TituloChip({
    super.key,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(6, 1, 6, 1),
          decoration: BoxDecoration(
            color: Color.fromARGB(184, 241, 238, 210),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            titulo,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

// 🔹 Exemplo de Chip (Simples/Básico)

class ChipBasico extends StatelessWidget {
  const ChipBasico({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 500,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 8,
        runSpacing: 4,
        children: [
          Chip(
            avatar: CircleAvatar(
                backgroundImage: AssetImage('assets/images/image_1.jpg')),
            label: Text('Van Halen'),
          ),
          Chip(
            avatar: CircleAvatar(
                backgroundImage: AssetImage('assets/images/image_2.jpg')),
            label: SelectableText('Wolfgang'),
          ),
        ],
      ),
    );
  }
}

// 🔹 Exemplo de InputChip

class InputChipExemplo extends StatefulWidget {
  const InputChipExemplo({super.key});

  @override
  State<InputChipExemplo> createState() => _InputChipExemploState();
}

class _InputChipExemploState extends State<InputChipExemplo> {
  int inputs = 3;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5.0,
          children: List<Widget>.generate(inputs, (int index) {
            return InputChip(
              label: Text('Pessoa ${index + 1}'),
              avatar: selectedIndex == index ? null : Icon(Icons.person),
              selected: selectedIndex == index,
              onSelected: (bool selected) {
                setState(() {
                  if (selectedIndex == index) {
                    selectedIndex = null;
                  } else {
                    selectedIndex = index;
                  }
                });
              },
              onDeleted: () {
                setState(() {
                  inputs = inputs - 1;
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              inputs = 3;
            });
          },
          child: const Text('Resetar'),
        ),
      ],
    );
  }
}

// 🔹 Exemplo de ChoiceChip

class ChoiceChipExemplo extends StatefulWidget {
  const ChoiceChipExemplo({super.key});

  @override
  State<ChoiceChipExemplo> createState() => _ChoiceChipExemploState();
}

class _ChoiceChipExemploState extends State<ChoiceChipExemplo> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        children: <Widget>[
          Text('Escolha uma pessoa:', style: textTheme.labelLarge),
          const SizedBox(height: 10.0),
          Wrap(
            spacing: 5.0,
            children: List<Widget>.generate(3, (int index) {
              return ChoiceChip(
                label: Text('Pessoa $index'),
                selected: _value == index,
                onSelected: (bool selected) {
                  setState(() {
                    _value = selected ? index : null;
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// 🔹 Exemplo de FilterChip

enum BandFilter {
  mothorhead('Mothorhead'),
  vanhalen('Van Halen'),
  poison('Poison'),
  pinkfloyd('Pink Floyd');

  // Propriedade para armazenar a String
  final String name;

  // Construtor para associar a String ao valor do enum
  const BandFilter(this.name);
}

class FilterChipExemplo extends StatefulWidget {
  const FilterChipExemplo({super.key});

  @override
  State<FilterChipExemplo> createState() => _FilterChipExemploState();
}

class _FilterChipExemploState extends State<FilterChipExemplo> {
  Set<BandFilter> filters = <BandFilter>{};

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Escolha as bandas', style: textTheme.labelLarge),
          const SizedBox(height: 5.0),
          Wrap(
            spacing: 5.0,
            children: BandFilter.values.map((BandFilter exercise) {
              return FilterChip(
                label: Text(exercise.name),
                selected: filters.contains(exercise),
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      filters.add(exercise);
                    } else {
                      filters.remove(exercise);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 10.0),
          Text(
            'Procurando por: ${filters.map((BandFilter e) => e.name).join(', ')}',
            style: textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}

// 🔹 Exemplo de ActionChip

class ActionChipExemplo extends StatefulWidget {
  const ActionChipExemplo({super.key});

  @override
  State<ActionChipExemplo> createState() => _ActionChipExemploState();
}

class _ActionChipExemploState extends State<ActionChipExemplo> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        avatar: Icon(favorite ? Icons.favorite : Icons.favorite_border),
        label: const Text('Salvar nos favoritos'),
        onPressed: () {
          setState(() {
            favorite = !favorite;
          });
        },
      ),
    );
  }
}
