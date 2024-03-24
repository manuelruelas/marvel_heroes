import 'package:marvel_heroes/domain/entity/comics.dart';

class Character {
  int id;
  String name;
  String? description;
  String? thumbnailUrl;
  List<Comics>? comicAppearances;
  Character({
    required this.id,
    required this.name,
    this.description,
    this.thumbnailUrl,
    this.comicAppearances,
  });
}
