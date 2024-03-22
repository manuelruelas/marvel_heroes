import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_heroes/data/model/marvel_api_data.dart';

part 'marvel_api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class MarvelApiResponse<T> {
  final int code;
  final String status;
  final String etag;
  final MarvelApiData<T> data;

  MarvelApiResponse({
    required this.code,
    required this.status,
    required this.etag,
    required this.data,
  });

  factory MarvelApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$MarvelApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$MarvelApiResponseToJson(this, toJsonT);
}
