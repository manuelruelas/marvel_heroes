// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarvelApiResponse<T> _$MarvelApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    MarvelApiResponse<T>(
      code: json['code'] as int,
      status: json['status'] as String,
      etag: json['etag'] as String,
      data: MarvelApiData<T>.fromJson(
          json['data'] as Map<String, dynamic>, (value) => fromJsonT(value)),
    );

Map<String, dynamic> _$MarvelApiResponseToJson<T>(
  MarvelApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'etag': instance.etag,
      'data': instance.data.toJson(
        (value) => toJsonT(value),
      ),
    };
