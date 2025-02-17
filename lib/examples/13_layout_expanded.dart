import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              // 🔹 Expande igualmente dentro da Row
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      50), // 🔹 Aplica bordas arredondadas
                  child: Image.asset(
                    'assets/images/image_1.jpg',
                    fit: BoxFit
                        .fill, // 🔹 Garante que a imagem cubra o espaço corretamente
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              Expanded(
                flex: 2, // Vai ocupar um espaço um pouco maior
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/image_2.jpg',
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/image_1.jpg',
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
