import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ListView.builder")),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: 1000, // 🔹 Pode ter milhares de itens sem travar
            itemBuilder: (context, index) {
              return ListTile(title: Text("Item ${index + 1}"));
            },
          ),
        ),
      ),
    );
  }
}
