// Exemplos de TimePicker
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
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
        appBar: AppBar(title: const Text('Exemplos de TimePicker')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Exemplo de TimePicker
              TimePickerExemplo(),
              SizedBox(height: 20),
              TimePickerExemplo2(),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔹 Exemplo de TimePicker
class TimePickerExemplo extends StatefulWidget {
  const TimePickerExemplo({super.key});

  @override
  State<TimePickerExemplo> createState() => _TimePickerExemploState();
}

class _TimePickerExemploState extends State<TimePickerExemplo> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    var time = selectedTime;

    return Column(children: [
      Text(
        time == null ? "Escolha um horário" : time.format(context),
      ),
      ElevatedButton.icon(
        icon: const Icon(Icons.calendar_today),
        onPressed: () async {
          var pickedTime = await showTimePicker(
            context: context,
            initialEntryMode: TimePickerEntryMode.dial,
            initialTime: TimeOfDay.now(),
          );

          setState(() {
            selectedTime = pickedTime;
          });
        },
        label: const Text('Selecionar Hora'),
      )
    ]);
  }
}

// ######################
// 🔹 Exemplo 2
// ######################
class TimePickerExemplo2 extends StatefulWidget {
  const TimePickerExemplo2({super.key});

  @override
  State<TimePickerExemplo2> createState() => _TimePickerExemplo2State();
}

class _TimePickerExemplo2State extends State<TimePickerExemplo2> {
  TimeOfDay? selectedTime;
  final TimeOfDay _horaMinima =
      const TimeOfDay(hour: 8, minute: 0); // 🔹 Hora mínima: 08:00
  final TimeOfDay _horaMaxima =
      const TimeOfDay(hour: 22, minute: 0); // 🔹 Hora máxima: 22:00

  @override
  Widget build(BuildContext context) {
    var time = selectedTime;

    return Column(children: [
      Text(
        time == null
            ? "Escolha um horário"
            : "Horário selecionado: ${time.format(context)}",
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),

      // 🔹 Botão para abrir o TimePicker
      ElevatedButton.icon(
        icon: const Icon(Icons.access_time),
        onPressed: () async {
          var pickedTime = await showTimePicker(
            context: context,
            initialEntryMode:
                TimePickerEntryMode.dial, // 🔹 Modo de entrada: Relógio
            initialTime: selectedTime ?? TimeOfDay.now(),
            helpText: "Selecione um horário", // 🔹 Texto do cabeçalho
            cancelText: "CANCELAR", // 🔹 Texto do botão de cancelar
            confirmText: "OK", // 🔹 Texto do botão de confirmar
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                    alwaysUse24HourFormat: true), // 🔹 Usa formato 24h
                child: child!,
              );
            },
          );

          if (pickedTime != null) {
            // 🔹 Verifica se está dentro do intervalo permitido
            if (_validarHorario(pickedTime)) {
              setState(() {
                selectedTime = pickedTime;
              });

              // 🔹 Exibe um SnackBar com a hora selecionada
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text("Horário escolhido: ${pickedTime.format(context)}"),
                  duration: const Duration(seconds: 2),
                ),
              );
            } else {
              // 🔹 Se a hora estiver fora do permitido, exibe alerta
              _mostrarAlerta(context);
            }
          }
        },
        label: const Text('Selecionar Hora'),
      ),
    ]);
  }

  // 🔹 Valida se o horário escolhido está dentro do permitido
  bool _validarHorario(TimeOfDay time) {
    if (time.hour < _horaMinima.hour ||
        (time.hour == _horaMinima.hour && time.minute < _horaMinima.minute)) {
      return false; // Antes do horário mínimo
    }
    if (time.hour > _horaMaxima.hour ||
        (time.hour == _horaMaxima.hour && time.minute > _horaMaxima.minute)) {
      return false; // Depois do horário máximo
    }
    return true;
  }

  // 🔹 Mostra um alerta se o horário estiver fora do intervalo permitido
  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Horário inválido"),
          content: Text(
              "O horário deve estar entre ${_horaMinima.format(context)} e ${_horaMaxima.format(context)}."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
