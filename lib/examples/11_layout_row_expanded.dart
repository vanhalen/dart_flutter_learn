import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // 🔹 Essa Row ocupa o mínimo de espaço possível
            Row(
              children: [
                Container(width: 50, height: 50, color: Colors.red),
                Container(width: 50, height: 50, color: Colors.blue),
              ],
            ),

            SizedBox(height: 20),

            // 🔹 Essa Row expande porque tem `Expanded`
            Row(
              children: [
                Expanded(child: Container(height: 50, color: Colors.green)),
                Expanded(child: Container(height: 50, color: Colors.orange)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
