import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

class MarvelApiInterceptor extends Interceptor {
  final String publicKey;
  final String privateKey;

  MarvelApiInterceptor(this.publicKey, this.privateKey);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = generateMd5('$timestamp$privateKey$publicKey');

    options.queryParameters.addAll({
      'apikey': publicKey,
      'ts': timestamp,
      'hash': hash,
    });

    return super.onRequest(options, handler);
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
