import 'package:get/get.dart';
import 'package:marvel_heroes/data/remote/character_service.dart';
import 'package:marvel_heroes/data/repository/character_repository_impl.dart';
import 'package:marvel_heroes/domain/repository/character_repository.dart';
import 'package:marvel_heroes/domain/usecase/fetch_characters_usecase.dart';
import 'package:marvel_heroes/presentation/pages/hero_list/hero_list_controller.dart';

class HeroListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterService>(() => CharacterService());
    Get.lazyPut<CharacterRepository>(
        () => CharacterRepositoryImpl(service: Get.find()));
    Get.lazyPut(() => FetchCharactersUsecase(repository: Get.find()));
    Get.lazyPut(() => HeroListController(Get.find()));
  }
}
