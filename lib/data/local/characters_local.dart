import 'package:marvel_heroes/core/data/local/local_db.dart';
import 'package:marvel_heroes/data/model/character_model.dart';
import 'package:sembast/sembast.dart';

class CharactersLocal {
  final LocalDB _localDB;
  static const String _storeName = 'characters_store';

  CharactersLocal({required LocalDB localDB}) : _localDB = localDB;

  Future<List<CharacterModel>> getCharacters(
      {int limit = 10, int offset = 0}) async {
    final database = await _localDB.database;
    final store = intMapStoreFactory.store(_storeName);
    final Finder finder = Finder(limit: limit, offset: offset);
    final records = await store.find(database, finder: finder);
    final characters =
        records.map((record) => CharacterModel.fromJson(record.value)).toList();
    return characters;
  }

  Future<void> insertCharacter(CharacterModel character) async {
    final database = await _localDB.database;
    final store = intMapStoreFactory.store(_storeName);
    await store.add(database, character.toJson());
  }

  Future<void> insertCharacters(List<CharacterModel> characters) async {
    final database = await _localDB.database;
    final store = intMapStoreFactory.store(_storeName);
    await store.addAll(
      database,
      characters.map((character) => character.toJson()).toList(),
    );
  }
}
