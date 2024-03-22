import 'package:json_annotation/json_annotation.dart';
part 'marvel_api_data.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class MarvelApiData<T> {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final T results;

  MarvelApiData({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  factory MarvelApiData.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$MarvelApiDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$MarvelApiDataToJson(this, toJsonT);
}
