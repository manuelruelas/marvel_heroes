import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:marvel_heroes/core/domain/usecase.dart';
import 'package:marvel_heroes/domain/entity/character.dart';
import 'package:marvel_heroes/domain/usecase/fetch_characters_usecase.dart';
import 'package:marvel_heroes/domain/usecase/get_characters_total_usecase.dart';
import 'package:marvel_heroes/presentation/pages/hero_list/hero_list_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'hero_list_controller_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetCharactersTotalUsecase>(),
  MockSpec<FetchCharactersUsecase>(),
])
void main() {
  Get.testMode = true;
  late HeroListController controller;
  late MockFetchCharactersUsecase mockFetchCharactersUsecase;
  late MockGetCharactersTotalUsecase mockGetCharactersTotalUsecase;

  setUpAll(() {
    mockFetchCharactersUsecase = MockFetchCharactersUsecase();
    mockGetCharactersTotalUsecase = MockGetCharactersTotalUsecase();
    controller = HeroListController(
      fetchCharactersUsecase: mockFetchCharactersUsecase,
      getCharactersTotalUsecase: mockGetCharactersTotalUsecase,
    );
    final characters = [
      Character(id: 1, name: 'Iron Man'),
      Character(id: 2, name: 'Captain America'),
      Character(id: 3, name: 'Spider-man')
    ];
    when(mockFetchCharactersUsecase.call(any))
        .thenAnswer((_) async => characters);
  });

  setUp(() {
    controller.characters.clear();
  });

  test('fetchCharacters should populate characters list', () async {
    await controller.fetchCharacters();

    expect(controller.characters.length, 3);

    verify(mockFetchCharactersUsecase.call(any)).called(1);
  });

  test('search() should filter characters based on query', () async {
    await controller.fetchCharacters();
    expect(controller.characters.length, equals(3));
    const query = 'man';
    controller.searchCharacters(query);

    expect(controller.characters.length, 2); //Just Iron Man and Spider-man
    expect(controller.infiniteScrollEnabled.value, false);
  });

  test("Characters list should be restore when user clear", () async {
    await controller.fetchCharacters();
    const query = 'hulk';
    controller.searchCharacters(query);
    expect(controller.characters.length, 0);
    controller.clearSearch();
    expect(controller.characters.length, 3);
  });
}
