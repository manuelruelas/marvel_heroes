import 'package:marvel_heroes/data/local/characters_local.dart';
import 'package:marvel_heroes/data/model/character_model.dart';
import 'package:marvel_heroes/data/remote/character_service.dart';
import 'package:marvel_heroes/domain/entity/character.dart';
import 'package:marvel_heroes/domain/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterService service;
  final CharactersLocal localCharacters;
  CharacterRepositoryImpl(
      {required this.service, required this.localCharacters});

  /// Persistence strategy
  /// Check if there's local results
  /// If local results is not empty returns local characters
  /// Else fetch from remote source and save in localDB
  /// Return fetched characters
  @override
  Future<List<Character>> getCharacters(
      {int limit = 10, int offset = 0}) async {
    List<CharacterModel> characters =
        await localCharacters.getCharacters(limit: limit, offset: offset);

    if (characters.isEmpty) {
      try {
        characters = await service.getCharacters(limit: limit, offset: offset);
        localCharacters.insertCharacters(characters);
      } catch (e) {
        rethrow;
      }
    }
    return characters.map((e) => e.toEntity()).toList();
  }

  @override
  Future<int> getCharactersTotal() async {
    final response = await service.getCharactersTotal();
    return response;
  }
}
