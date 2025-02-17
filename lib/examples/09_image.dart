// Exemplo do widget Image

//  Os widgets de Image devem estar dentro de algum
// desses: MaterialApp , WidgetsApp ou MediaQuery

// Extensões suportadas: : JPEG, PNG, GIF, GIF animado, WebP, WebP animado, BMP e WBMP.

import 'dart:typed_data'; // Necessário para Image.memory
import 'package:flutter/material.dart';
import 'dart:io'; // Necessário para Image.file

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Exemplo Completo de Imagem")),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: ListView(
              children: [
                // ###
                // ### ↓↓↓ Exemplos - Início ↓↓↓
                // ###

                // 🔹 Imagem da Internet (NetworkImage)
                _buildSectionTitle("Imagem da Internet"),
                Image(
                  image: NetworkImage(
                      'https://images.rodrigorchagas.com.br/default/vh1.png'),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      // Barra de progresso linear (horizontal)
                      child: LinearProgressIndicator(),
                      // child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Text("Erro ao carregar a imagem.");
                  },
                ),

                SizedBox(height: 20),

                // 🔹 Imagem do App (AssetImage)
                _buildSectionTitle("Imagem do App (Assets + Cor)"),
                Image(
                  image: AssetImage('assets/images/image_1.jpg'),
                  width: 200, // Tamanho personalizado
                  height: 150,
                  fit: BoxFit.cover, // Ajusta a imagem ao espaço disponível
                  color: Colors.red,
                  colorBlendMode: BlendMode.colorBurn,
                ),

                SizedBox(height: 20),

                // 🔹 Exemplo de Image com Opacidade
                _buildSectionTitle("Imagem com Opacidade"),
                Image.asset(
                  'assets/images/image_1.jpg',
                  opacity: AlwaysStoppedAnimation(0.5), // 50% transparente
                ),

                SizedBox(height: 20),

                // 🔹 Imagem com Bordas Arredondadas
                _buildSectionTitle("Imagem com Bordas Arredondadas"),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30), // Borda arredondada
                  child: Image.asset('assets/images/image_2.jpg'),
                ),

                SizedBox(height: 20),

                // 🔹 Imagem com BoxFit para Ajuste de Tamanho
                _buildSectionTitle("Imagem com BoxFit"),
                Container(
                  // width: 300,
                  // height: 150,
                  color: Colors.grey[300],
                  child: Image.asset(
                    'assets/images/image_3.webp',
                    fit: BoxFit
                        .contain, // Preenche o espaço sem distorcer a imagem
                  ),
                ),

                // 🔹 Imagem do Dispositivo (FileImage) - Exemplo Simulado
                _buildSectionTitle("Imagem do Dispositivo (File)"),
                _buildFileImage(), // Simulação do uso de FileImage

                SizedBox(height: 20),

                // 🔹 Imagem da Memória (MemoryImage) - Exemplo Simulado
                _buildSectionTitle("Imagem da Memória"),
                _buildMemoryImage(),

                SizedBox(height: 20),

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

  /// 🔹 Widget para exibir título da seção
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8, top: 16),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  /// 🔹 Simulação de Image.file
  Widget _buildFileImage() {
    File?
        fakeFile; // Substituir por um `File` real obtido via FilePicker ou ImagePicker
    return fakeFile == null
        ? Text("Nenhuma imagem selecionada.")
        : Image.file(fakeFile);
  }

  /// 🔹 Simulação de Image.memory
  Widget _buildMemoryImage() {
    Uint8List?
        fakeMemoryImage; // Substituir por um Uint8List real carregado da memória
    return fakeMemoryImage == null
        ? Text("Nenhuma imagem carregada da memória.")
        : Image.memory(fakeMemoryImage);
  }
}
