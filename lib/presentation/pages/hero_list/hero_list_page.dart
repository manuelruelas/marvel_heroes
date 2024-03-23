import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_heroes/presentation/pages/hero_list/hero_list_controller.dart';
import 'package:marvel_heroes/presentation/widgets/character_item.dart';

class HeroListPage extends StatelessWidget {
  HeroListPage({super.key}) {
    _scrollController.addListener(_scrollListener);
  }

  final ScrollController _scrollController = ScrollController();
  final HeroListController _controller = Get.find();

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _controller.fetchCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          controller: _scrollController,
          itemCount: _controller.characters.length + 1,
          itemBuilder: (context, index) {
            if (index == _controller.characters.length) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              final characters = _controller.characters;
              return CharacterItem(character: characters[index]);
            }
          },
        ),
      ),
    );
  }
}
