import 'dart:async';
import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:marvel_heroes/core/domain/usecase.dart';
import 'package:marvel_heroes/domain/entity/character.dart';
import 'package:marvel_heroes/domain/usecase/fetch_characters_usecase.dart';
import 'package:marvel_heroes/domain/usecase/get_characters_total_usecase.dart';

class HeroListController extends GetxController {
  final FetchCharactersUsecase _fetchCharactersUsecase;
  final GetCharactersTotalUsecase _getCharactersTotalUsecase;

  HeroListController({
    required FetchCharactersUsecase fetchCharactersUsecase,
    required GetCharactersTotalUsecase getCharactersTotalUsecase,
  })  : _fetchCharactersUsecase = fetchCharactersUsecase,
        _getCharactersTotalUsecase = getCharactersTotalUsecase;

  final characters = <Character>[].obs;
  var isLoading = true.obs;
  var infiniteScrollEnabled = true.obs;
  final charactersTotal = 0.obs;

  List<Character> _originalCharacters = [];

  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();
    getTotal();
  }

  void getTotal() async {
    final total = await _getCharactersTotalUsecase.call(NoParams());
    charactersTotal.value = total;
  }

  Future<void> fetchCharacters() async {
    isLoading(true);
    try {
      final fetchedCharacters =
          await _fetchCharactersUsecase.call(FetchCharactersParams(
        offset: characters.length,
      ));
      characters.addAll(fetchedCharacters);
      _originalCharacters = characters.toList();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
    }
  }

  /// Search in loaded characters
  /// Delay search 500 milliseconds
  /// When query is empty load origina characters
  Future<void> onSearchChange(String query) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchCharacters(query);
    });
  }

  void searchCharacters(String query) {
    infiniteScrollEnabled(false);
    if (query.isEmpty) {
      clearSearch();
      return;
    }

    final queryLowercase = query.toLowerCase();
    final filteredCharacters = _originalCharacters
        .where((character) =>
            character.name.toLowerCase().contains(queryLowercase))
        .toList();
    characters.value = filteredCharacters;
  }

  void clearSearch() {
    characters.value = _originalCharacters;
    infiniteScrollEnabled(true);
  }
}
