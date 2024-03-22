// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_api_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarvelApiData<T> _$MarvelApiDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    MarvelApiData<T>(
      offset: json['offset'] as int,
      limit: json['limit'] as int,
      total: json['total'] as int,
      count: json['count'] as int,
      results: fromJsonT(json['results']),
    );

Map<String, dynamic> _$MarvelApiDataToJson<T>(
  MarvelApiData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'total': instance.total,
      'count': instance.count,
      'results': toJsonT(instance.results),
    };
