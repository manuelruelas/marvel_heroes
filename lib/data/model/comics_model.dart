import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_heroes/data/model/comic_appearances_model.dart';

part 'comics_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ComicsModel {
  List<ComicAppearancesModel> items;

  ComicsModel({required this.items});

  factory ComicsModel.fromJson(json) => _$ComicsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsModelToJson(this);
}
