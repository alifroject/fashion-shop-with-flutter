import 'package:dio/dio.dart';
import 'storage_service.dart';

// Hadnling http requests and headers

class ApiClient {
  final Dio _dio;
  final StorageService _storage = StorageService();

  ApiClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'http://10.0.2.2:8080', // go gin
          //baseUrl: 'http://10.0.2.2:3005', // express js or nest js
          //baseUrl: 'http://****** */:3005', //connect to android
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

  void clearAuthHeader() {
    _dio.options.headers.remove('Authorization');
  }
}
