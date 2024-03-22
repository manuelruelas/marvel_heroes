import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class LocalDB {
  static Future<Database> init() async {
    String dbPath = 'marvel.db';
    DatabaseFactory dbFactory = databaseFactoryIo;

    Database db = await dbFactory.openDatabase(dbPath);
    return db;
  }
}
