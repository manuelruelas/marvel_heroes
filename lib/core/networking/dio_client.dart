import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  Future<T> getRequest<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(path,
          queryParameters: queryParameters, options: Options(headers: headers));
      return response.data as T;
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleError(dynamic error) {
    if (error is DioException) {
      return error;
    } else {
      return error;
    }
  }
}
