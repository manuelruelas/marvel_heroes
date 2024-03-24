import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_heroes/domain/entity/comics.dart';

part 'comic_appearances_model.g.dart';

@JsonSerializable()
class ComicAppearancesModel {
  String name;

  ComicAppearancesModel({required this.name});

  factory ComicAppearancesModel.fromJson(json) =>
      _$ComicAppearancesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicAppearancesModelToJson(this);

  Comics toEntity() => Comics(name: name);
}
