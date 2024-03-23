import 'package:dio/dio.dart';
import 'package:marvel_heroes/data/model/character_model.dart';
import 'package:marvel_heroes/data/model/marvel_api_data.dart';
import 'package:marvel_heroes/data/model/marvel_api_response.dart';

class CharacterService {
  Dio client;

  CharacterService({required this.client});

  Future<List<CharacterModel>> getCharacters(
      {int offset = 0, int limit = 10}) async {
    try {
      final response = await client.get<Map<String, dynamic>>('/characters',
          queryParameters: {"offset": offset, "limit": limit});
      final apiResponse = MarvelApiResponse<List<CharacterModel>>.fromJson(
        response.data as Map<String, dynamic>,
        (jsonList) => (jsonList as List)
            .map(
              (char) => CharacterModel.fromJson(char as Map<String, dynamic>),
            )
            .toList(),
      );
      return apiResponse.data.results;
    } catch (e) {
      rethrow;
    }
  }
}
