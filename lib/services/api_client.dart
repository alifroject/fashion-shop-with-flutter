import 'package:dio/dio.dart';
import 'storage_service.dart';

class ApiClient {
  final Dio _dio;
  final StorageService _storage = StorageService();

  ApiClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'http://localhost:3005/',
          headers: {"Content-type": 'application/json'},
        ),
      );

  Future<Response> get(String path, {bool auth = false}) async {
    if (auth) {
      final token = await _storage.getToken();
      if (token != null) {
        _dio.options.headers['Authorization'] = 'Bearer $token';
      }
    }
    return _dio.get(path);
  }

//Post request with token 
  Future<Response> post(
    String path,
    Map<String, dynamic> data, {
    bool auth = false,
  }) async {
    if (auth) {
      final token = await _storage.getToken();
      if (token != null) {
        _dio.options.headers['Authorization'] = 'Bearer $token';
      }
    }
    return _dio.post(path, data: data);
  }
}
