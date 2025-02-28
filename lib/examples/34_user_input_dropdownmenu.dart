// Exemplo de DropdownMenu
import 'package:flutter/material.dart';

// 🔹 Enum com rótulos e cores para as opções
enum ColorLabel {
  blue('Azul', Colors.blue),
  pink('Rosa', Colors.pink),
  green('Verde', Colors.green),
  yellow('Amarelo', Colors.yellow),
  grey('Cinza', Colors.grey);

  // 🔹 Construtor e propriedades do Enum
  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 🔹 Controlador para o TextField do DropdownMenu
  final TextEditingController colorController = TextEditingController();
  ColorLabel? selectedColor = ColorLabel.green; // 🔹 Seleção inicial

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Exemplo de DropdownMenu')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Escolha uma cor:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DropdownMenu<ColorLabel>(
                initialSelection: ColorLabel.green,
                controller: colorController,
                requestFocusOnTap: true, // 🔹 Foca no TextField ao tocar
                label: const Text('Cor'),
                onSelected: (ColorLabel? color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
                dropdownMenuEntries: ColorLabel.values
                    .map<DropdownMenuEntry<ColorLabel>>((ColorLabel color) {
                  return DropdownMenuEntry<ColorLabel>(
                    value: color,
                    label: color.label,
                    enabled:
                        color.label != 'Cinza', // 🔹 Desativa a opção 'Grey'
                    style: MenuItemButton.styleFrom(
                      foregroundColor: color.color, // 🔹 Cor do texto
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Text(
                'Cor selecionada:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                selectedColor?.label ?? 'Nenhuma',
                style: TextStyle(
                  fontSize: 24,
                  color: selectedColor?.color ?? Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔹 Um DropDownMenu Simples para melhor entendimento

class DropDownMenuSimples extends StatelessWidget {
  const DropDownMenuSimples({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      label: const Text('Simples'),
      dropdownMenuEntries: [1, 2, 3].map<DropdownMenuEntry<int>>((int value) {
        return DropdownMenuEntry<int>(
          value: value,
          label: value.toString(), // 🔹 Converte o int para texto
        );
      }).toList(),
    );
  }
}
