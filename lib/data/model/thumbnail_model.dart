import 'package:json_annotation/json_annotation.dart';

part "thumbnail_model.g.dart";

@JsonSerializable()
class ThumbnailModel {
  String? path;
  String? extension;

  ThumbnailModel({this.path, this.extension});

  factory ThumbnailModel.fromJson(json) => _$ThumbnailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailModelToJson(this);

  String get url => "$path.$extension";
}
