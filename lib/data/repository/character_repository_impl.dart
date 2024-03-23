import 'package:marvel_heroes/data/remote/character_service.dart';
import 'package:marvel_heroes/domain/entity/character.dart';
import 'package:marvel_heroes/domain/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterService service;

  CharacterRepositoryImpl({required this.service});

  @override
  Future<List<Character>> getCharacters(
      {int limit = 0, int offset = 10}) async {
    final characters =
        await service.getCharacters(limit: limit, offset: offset);

    return characters.map((e) => e.toEntity()).toList();
  }
}
