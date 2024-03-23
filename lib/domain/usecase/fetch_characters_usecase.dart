import 'package:marvel_heroes/core/domain/usecase.dart';
import 'package:marvel_heroes/domain/entity/character.dart';
import 'package:marvel_heroes/domain/repository/character_repository.dart';

class FetchCharactersUsecase
    implements UseCase<List<Character>, FetchCharactersParams> {
  final CharacterRepository repository;

  FetchCharactersUsecase({required this.repository});

  @override
  Future<List<Character>> call(FetchCharactersParams params) {
    final limit = params.offset > 0 ? 10 : 20;
    return repository.getCharacters(limit: limit, offset: params.offset);
  }
}

class FetchCharactersParams {
  int limit;
  int offset;

  FetchCharactersParams({this.limit = 10, this.offset = 0});
}
