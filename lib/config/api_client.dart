import 'package:dio/dio.dart';

class ApiClient {
  static ApiClient? _instance;
  final Dio _dio;

  factory ApiClient({required String baseUrl}) {
    if (_instance == null) {
      final dio = Dio(BaseOptions(baseUrl: baseUrl));
      _instance = ApiClient._(dio);
    }

    return _instance ?? ApiClient._(Dio(BaseOptions(baseUrl: baseUrl)));
  }

  ApiClient._(this._dio);

  Future<Response> get({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: await _getHeaders(headers),
    );
  }

  Future<Response> post({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    return _dio.post(
      path,
      queryParameters: queryParameters,
      data: data,
      options: await _getHeaders(headers),
    );
  }

  Future<Response> put({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    return _dio.put(
      path,
      queryParameters: queryParameters,
      data: data,
      options: await _getHeaders(headers),
    );
  }

  Future<Response> delete({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _dio.delete(
      path,
      queryParameters: queryParameters,
      options: await _getHeaders(headers),
    );
  }

  Future<Response> patch({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    return _dio.patch(
      path,
      queryParameters: queryParameters,
      data: data,
      options: await _getHeaders(headers),
    );
  }

  Future<Options> _getHeaders(Map<String, String>? headers) async {
    return Options(
      headers: {}
        ..addAll(headers ?? {})
        ..addAll({
          'Content-Type': 'application/json; charset=utf-8',
        }),
    );
  }
}