import 'package:get/state_manager.dart';
import 'package:marvel_heroes/domain/entity/character.dart';
import 'package:marvel_heroes/domain/usecase/fetch_characters_usecase.dart';

class HeroListController extends GetxController {
  final FetchCharactersUsecase _fetchCharactersUsecase;

  HeroListController(this._fetchCharactersUsecase);

  final characters = <Character>[].obs;
  var isLoading = true.obs;
  var currentPage = 0.obs;
  final pageSize = 20;

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
      currentPage++;
    } finally {
      isLoading(false);
    }
  }
}
