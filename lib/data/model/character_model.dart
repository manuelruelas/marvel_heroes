import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_heroes/domain/entity/character.dart';
part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends Character {
  CharacterModel({
    required super.id,
    required super.name,
    super.description,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
