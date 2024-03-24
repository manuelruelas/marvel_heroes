// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] == null
          ? null
          : ThumbnailModel.fromJson(json['thumbnail']),
      comics:
          json['comics'] == null ? null : ComicsModel.fromJson(json['comics']),
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'thumbnail': instance.thumbnail?.toJson(),
      'comics': instance.comics?.toJson(),
    };
