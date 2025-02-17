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
            // 🔹Combinando Row com Column
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, //Divide o espaço horizontal livre uniformemente
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(50), // Borda arredondada
                      child: Image(
                        width: 100,
                        height: 100,
                        image: AssetImage('assets/images/image_2.jpg'),
                      ),
                    ),
                    Text('Imagem 1'),
                  ],
                ),
                Column(
                  children: [
                    Image(
                      width: 100,
                      height: 100,
                      image: AssetImage('assets/images/image_1.jpg'),
                    ),
                    Text('Imagem 2'),
                  ],
                ),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(50), // Borda arredondada
                      child: Image(
                        width: 100,
                        height: 100,
                        image: AssetImage('assets/images/image_2.jpg'),
                      ),
                    ),
                    Text('Imagem 3'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
