import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_heroes/domain/entity/character.dart';
import 'package:marvel_heroes/domain/entity/comics.dart';

class HeroDetailPage extends StatelessWidget {
  const HeroDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final character = Get.arguments as Character;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: character.id,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(character.thumbnailUrl ?? ""),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.2,
            maxChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.name,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        character.description!.isNotEmpty
                            ? character.description!
                            : 'No description available',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      if (character.comicAppearances != null) ...{
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Comic Appearances",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: character.comicAppearances!.isEmpty
                                  ? Text(
                                      character.description!.isNotEmpty
                                          ? character.description!
                                          : 'No comics available',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: Colors.black54),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        for (Comics comic
                                            in character.comicAppearances!)
                                          Text(
                                            "- ${comic.name}",
                                            style:
                                                const TextStyle(fontSize: 12.0),
                                          ),
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      }
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
