import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:marvel_heroes/core/data/local/local_db.dart';
import 'package:marvel_heroes/core/data/networking/marvel_dio_client.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalDB>(() => LocalDB(), fenix: true);
    final publicKey = dotenv.env['MARVEL_PUBLIC_KEY']!;
    final privateKey = dotenv.env['MARVEL_PRIVATE_KEY']!;
    Get.lazyPut(() => MarvelDioClient.init(publicKey, privateKey));
  }
}
