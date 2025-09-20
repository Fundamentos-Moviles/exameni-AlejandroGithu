import 'package:flutter/material.dart';
import 'memorama.dart'; // Importa el archivo donde está definido Principal

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memorama',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Principal(), // Reemplaza MyHomePage con Principal
    );
  }
}

// Elimina las clases MyHomePage, _MyHomePageState si no las necesitas