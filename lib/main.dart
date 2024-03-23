import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:marvel_heroes/presentation/bindings/app_binding.dart';
import 'package:marvel_heroes/presentation/bindings/hero_list_binding.dart';
import 'package:marvel_heroes/presentation/pages/hero_detail/hero_detail_page.dart';
import 'package:marvel_heroes/presentation/pages/hero_list/hero_list_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/character",
      initialBinding: AppBinding(),
      getPages: [
        GetPage(
          name: "/character",
          page: () => HeroListPage(),
          binding: HeroListBinding(),
        ),
        GetPage(
          name: "/detail",
          page: () => const HeroDetailPage(),
        ),
      ],
    );
  }
}
