import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes/domain/repository/character_repository.dart';
import 'package:marvel_heroes/domain/usecase/fetch_characters_usecase.dart';
import 'package:mockito/annotations.dart';

import 'package:mockito/mockito.dart';

import 'fetch_character_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CharacterRepository>()])
void main() {
  late FetchCharactersUsecase fetchCharactersUsecase;
  late MockCharacterRepository mockRepository;

  setUp(() {
    mockRepository = MockCharacterRepository();
    fetchCharactersUsecase = FetchCharactersUsecase(repository: mockRepository);
    when(mockRepository.getCharacters()).thenAnswer((_) async => []);
  });

  test(
      'fetchCharactersUsecase should call getCharacters with correct parameters',
      () async {
    final params = FetchCharactersParams(offset: 0);
    const expectedLimit = 20;
    const expectedOffset = 0;

    await fetchCharactersUsecase.call(params);

    verify(mockRepository.getCharacters(
            limit: expectedLimit, offset: expectedOffset))
        .called(1);
  });

  test('fetchCharactersUsecase should adjust limit correctly based on offset',
      () async {
    final params = FetchCharactersParams(offset: 10);
    const expectedLimit = 10;
    const expectedOffset = 10;

    await fetchCharactersUsecase.call(params);

    verify(mockRepository.getCharacters(
            limit: expectedLimit, offset: expectedOffset))
        .called(1);
  });
}
