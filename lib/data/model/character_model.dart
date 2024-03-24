import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_heroes/data/model/comics_model.dart';
import 'package:marvel_heroes/data/model/thumbnail_model.dart';
import 'package:marvel_heroes/domain/entity/character.dart';
part 'character_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CharacterModel {
  int id;
  String name;
  String? description;
  ThumbnailModel? thumbnail;
  ComicsModel? comics;

  CharacterModel({
    required this.id,
    required this.name,
    this.description,
    this.thumbnail,
    this.comics,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);

  Character toEntity() => Character(
        id: id,
        name: name,
        description: description,
        thumbnailUrl: thumbnail?.url,
        comicAppearances: comics?.items
            .map(
              (comic) => comic.toEntity(),
            )
            .toList(),
      );
}
