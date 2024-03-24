// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicsModel _$ComicsModelFromJson(Map<String, dynamic> json) => ComicsModel(
      items: (json['items'] as List<dynamic>)
          .map(ComicAppearancesModel.fromJson)
          .toList(),
    );

Map<String, dynamic> _$ComicsModelToJson(ComicsModel instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
