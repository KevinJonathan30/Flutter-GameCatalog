import 'package:flutter/material.dart';
import 'package:game_catalog/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameCatalog',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(title: 'GameCatalog'),
      debugShowCheckedModeBanner: false,
    );
  }
}