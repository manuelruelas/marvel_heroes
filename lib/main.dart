import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_heroes/presentation/bindings/hero_list_binding.dart';
import 'package:marvel_heroes/presentation/pages/hero_list/hero_list_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/character",
      getPages: [
        GetPage(
            name: "/character",
            page: () => HeroListPage(),
            binding: HeroListBinding())
      ],
    );
  }
}
