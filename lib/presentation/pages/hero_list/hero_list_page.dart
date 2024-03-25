import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:marvel_heroes/presentation/pages/hero_list/hero_list_controller.dart';
import 'package:marvel_heroes/presentation/widgets/character_item.dart';
import 'package:marvel_heroes/presentation/widgets/counter_card.dart';

class HeroListPage extends StatelessWidget {
  HeroListPage({super.key}) {
    _scrollController.addListener(_scrollListener);
    _controller.fetchCharacters();
  }

  final ScrollController _scrollController = ScrollController();
  final HeroListController _controller = Get.find();
  final TextEditingController _searchController = TextEditingController();

  void _scrollListener() {
    final isLoading = _controller.isLoading.value;
    final infiniteScrollEnabled = _controller.infiniteScrollEnabled.value;

    if (!infiniteScrollEnabled || isLoading) return;

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
              controller: _searchController,
              leading: const Icon(Icons.search),
              hintText: "Search",
              onChanged: (value) {
                _controller.onSearchChange(value);
              },
              keyboardType: TextInputType.text,
              trailing: [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _controller.clearSearch();
                  },
                ),
              ],
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
                () {
                  if (_controller.characters.isEmpty) {
                    return Center(
                      child: Text(
                        "Results not found",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    );
                  }

                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: _controller.characters.length + 1,
                    itemBuilder: (context, index) {
                      /// Show loading indicator when user reach the last item
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
                            Get.toNamed("/detail",
                                arguments: characters[index]);
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
