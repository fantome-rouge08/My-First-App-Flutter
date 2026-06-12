import 'package:flutter/material.dart';
import '/pages/accueil.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('FR_fr', null).then((_) {
    runApp(const MyApp());
  });
}

/// Widget de l'application qui configure le thème global
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paroisse Saint Léonard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
