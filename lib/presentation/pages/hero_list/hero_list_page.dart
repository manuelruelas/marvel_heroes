import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_heroes/presentation/pages/hero_list/hero_list_controller.dart';

class HeroListPage extends StatelessWidget {
  HeroListPage({super.key});

  final HeroListController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: _controller.characters.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_controller.characters[index].name),
            );
          },
        ),
      ),
    );
  }
}
