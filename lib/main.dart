import 'package:flutter/material.dart';
import 'package:marvel_heroes/presentation/pages/hero_list/hero_list_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HeroListPage(),
    );
  }
}
