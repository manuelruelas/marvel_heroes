import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class LocalDB {
  static final LocalDB _instance = LocalDB._();
  static Database? _database;

  factory LocalDB() {
    return _instance;
  }

  LocalDB._();

  Future<Database> get database async {
    _database ??= await _init();
    return _database!;
  }

  Future<Database> _init() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    final dbPath = '${Directory(appDocumentDir.path).path}/marvel.db';
    final databaseFactory = databaseFactoryIo;

    return await databaseFactory.openDatabase(dbPath);
  }

  Future<void> closeDatabase() async {
    await _database?.close();
    _database = null;
  }
}
