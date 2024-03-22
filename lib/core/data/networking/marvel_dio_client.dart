import 'package:dio/dio.dart';
import 'package:marvel_heroes/core/data/networking/marvel_api_inteceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MarvelDioClient {
  static Dio init(String publicKey, String privateKey) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://gateway.marvel.com/v1/public',
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
    //dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(MarvelApiInterceptor(publicKey, privateKey));
    return dio;
  }
}
