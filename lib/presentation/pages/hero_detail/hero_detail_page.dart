import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_heroes/domain/entity/character.dart';

class HeroDetailPage extends StatelessWidget {
  const HeroDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final character = Get.arguments as Character;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Personaje'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(character.thumbnailUrl ?? ""),
                  fit: BoxFit.cover,
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
                        character.description ?? 'No description available',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      // Otros detalles del personaje
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
