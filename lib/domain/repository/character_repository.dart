import 'package:marvel_heroes/domain/entity/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters({int limit, int offset});

  Future<int> getCharactersTotal();
}
