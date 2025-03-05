// Exemplos de DatePicker
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  // 🔹 Inicializa a formatação de data para o pt_BR (Português do Brasil)
  initializeDateFormatting('pt_BR', null).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Configurações de localização
      locale: const Locale('pt', 'BR'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      home: Scaffold(
        appBar: AppBar(title: const Text('Exemplos de DatePicker')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Exemplo de DatePicker
              DatePickerExemplo(),
              SizedBox(height: 20),
              DatePickerExemplo2(),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔹 Exemplo de DatePicker
class DatePickerExemplo extends StatefulWidget {
  const DatePickerExemplo({super.key});

  @override
  State<DatePickerExemplo> createState() => _DatePickerExemploState();
}

class _DatePickerExemploState extends State<DatePickerExemplo> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    var date = selectedDate;

    return Column(children: [
      Text(
        date == null
            ? "Nenhuma data escolhida."
            : DateFormat('dd/MM/yyyy', 'pt_BR').format(date),
      ),
      ElevatedButton.icon(
        icon: const Icon(Icons.calendar_today),
        onPressed: () async {
          var pickedDate = await showDatePicker(
            context: context,
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime(2050),
            // Opcional: forçar localização aqui também
            locale: const Locale('pt', 'BR'),
          );

          setState(() {
            selectedDate = pickedDate;
          });
        },
        label: const Text('Escolha uma data'),
      )
    ]);
  }
}

class DatePickerExemplo2 extends StatefulWidget {
  const DatePickerExemplo2({super.key});

  @override
  State<DatePickerExemplo2> createState() => _DatePickerExemplo2State();
}

class _DatePickerExemplo2State extends State<DatePickerExemplo2> {
  DateTimeRange? selectedDateRange;

  Future<void> _selectDateRange() async {
    final DateTimeRange? pickedDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(), // Desativa datas anteriores
      lastDate: DateTime(
          DateTime.now().year + 5), // Permite selecionar até 5 anos no futuro
      initialDateRange:
          selectedDateRange, // Mantém a seleção anterior, se houver
      saveText: 'Confirmar', // Texto do botão de confirmação
      cancelText: 'Cancelar', // Texto do botão de cancelamento
      helpText: 'Selecione o período', // Texto de ajuda
    );

    if (pickedDateRange != null) {
      setState(() {
        selectedDateRange = pickedDateRange;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Seleção de Período de Datas',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          selectedDateRange == null
              ? 'Nenhum período selecionado'
              : 'Período selecionado: '
                  '${DateFormat('dd/MM/yyyy').format(selectedDateRange!.start)} - '
                  '${DateFormat('dd/MM/yyyy').format(selectedDateRange!.end)}',
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          icon: const Icon(Icons.calendar_month),
          onPressed: _selectDateRange,
          label: const Text('Selecionar Período'),
        ),
      ],
    );
  }
}
