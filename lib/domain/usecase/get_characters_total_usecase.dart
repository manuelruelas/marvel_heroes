import 'package:marvel_heroes/core/domain/usecase.dart';
import 'package:marvel_heroes/domain/repository/character_repository.dart';

class GetCharactersTotalUsecase implements UseCase<int, NoParams> {
  GetCharactersTotalUsecase({required CharacterRepository repository})
      : _characterRepository = repository;

  final CharacterRepository _characterRepository;
  @override
  Future<int> call(NoParams params) async {
    return await _characterRepository.getCharactersTotal();
  }
}
