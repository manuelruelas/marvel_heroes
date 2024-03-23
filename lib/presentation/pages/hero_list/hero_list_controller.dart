import 'dart:async';

import 'package:get/state_manager.dart';
import 'package:marvel_heroes/domain/entity/character.dart';
import 'package:marvel_heroes/domain/usecase/fetch_characters_usecase.dart';

class HeroListController extends GetxController {
  final FetchCharactersUsecase _fetchCharactersUsecase;

  HeroListController(this._fetchCharactersUsecase);
  final List<Character> _originalCharacters = [];
  final characters = <Character>[].obs;
  var isLoading = true.obs;
  var currentPage = 0.obs;
  final pageSize = 20;
  var infiniteScrollEnabled = true.obs;
  Timer? _debounce;
  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }

  void fetchCharacters() async {
    try {
      isLoading(true);
      final fetchedCharacters =
          await _fetchCharactersUsecase.call(FetchCharactersParams(
        offset: characters.length,
      ));
      characters.addAll(fetchedCharacters);
      _originalCharacters.addAll(fetchedCharacters);
      currentPage++;
    } finally {
      isLoading(false);
    }
  }

  /// Search in loaded characters
  /// Delay search 500 milliseconds
  /// When query is empty load origina characters
  void search(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      infiniteScrollEnabled(false);
      if (query.isEmpty) {
        characters.value = _originalCharacters;
        infiniteScrollEnabled(true);
        return;
      }

      final queryLowercase = query.toLowerCase();
      final filteredCharacters = characters
          .where((character) =>
              character.name.toLowerCase().contains(queryLowercase))
          .toList();
      characters.value = filteredCharacters;
    });
  }
}
