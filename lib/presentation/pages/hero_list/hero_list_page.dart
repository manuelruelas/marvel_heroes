import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';
import 'package:marvel_heroes/presentation/pages/hero_list/hero_list_controller.dart';
import 'package:marvel_heroes/presentation/widgets/character_item.dart';

class HeroListPage extends StatelessWidget {
  HeroListPage({super.key}) {
    _scrollController.addListener(_scrollListener);
  }

  final ScrollController _scrollController = ScrollController();
  final HeroListController _controller = Get.find();

  void _scrollListener() {
    if (!_controller.infiniteScrollEnabled.value) return;
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _controller.fetchCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Characters"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              leading: const Icon(Icons.search),
              hintText: "Search",
              onChanged: (value) {
                _controller.search(value);
              },
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(
                  () => CounterCard(
                    title: "Listed",
                    value: _controller.characters.length,
                  ),
                ),
                Obx(
                  () => CounterCard(
                    title: "Total",
                    value: _controller.charactersTotal.value,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => ListView.builder(
                  controller: _scrollController,
                  itemCount: _controller.characters.length + 1,
                  itemBuilder: (context, index) {
                    if (index == _controller.characters.length) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: _controller.infiniteScrollEnabled.value
                              ? const CircularProgressIndicator()
                              : Container(),
                        ),
                      );
                    } else {
                      final characters = _controller.characters;
                      return CharacterItem(
                        character: characters[index],
                        onPressed: () {
                          Get.toNamed("/detail", arguments: characters[index]);
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CounterCard extends StatelessWidget {
  final int value;
  final String title;
  const CounterCard({super.key, this.value = 0, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value.toString(),
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(title),
      ],
    );
  }
}
