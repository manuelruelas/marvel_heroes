import 'package:marvel_heroes/data/model/character_model.dart';

class CharacterService {
  CharacterService();

  Future<List<CharacterModel>> getCharacters() async {
    Future.delayed(
      const Duration(seconds: 2),
    );
    return [
      CharacterModel(id: 1, name: "capitan america"),
      CharacterModel(id: 2, name: "Ironman")
    ].toList();
  }
}
