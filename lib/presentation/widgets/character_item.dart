import 'package:flutter/material.dart';
import 'package:marvel_heroes/domain/entity/character.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    super.key,
    required this.character,
    this.onPressed,
  });

  final Character character;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed!();
      },
      child: Card(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                    16.0), // Esquina superior izquierda redondeada
                bottomLeft: Radius.circular(
                    16.0), // Esquina inferior izquierda redondeada
              ),
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/loading.gif",
                image: character.thumbnailUrl!,
                height: 100,
                width: 100,
                imageCacheHeight: 100,
                imageCacheWidth: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      character.description ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.black54),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
