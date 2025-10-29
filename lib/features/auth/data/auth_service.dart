import 'package:outfit_store/models/user_model.dart'; //user model for User
import '../../../../../services/api_client.dart';
import '../../../../../services/storage_service.dart';

class AuthService {
  final ApiClient _appClient = ApiClient();
  final StorageService _storage = StorageService();

  //Signup
  Future<User> signup(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    final response = await _appClient.post('/api/auth/signup', {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    });
    final userJson = response.data['user'];
    final token = response.data['token'];

    //save token locally
    await _storage.saveToken(token);
    return User.fromJson(userJson);
  }

  //Login
  Future<User> login(String email, String password) async {
    final response = await _appClient.post("/api/auth/login", {
      'email': email,
      'password': password,
    });

    print(response.data);
    final data = response.data;
    final token = data['token']?.toString();
    final userData = data['user'] as Map<String, dynamic>?;
    if (token == null || userData == null) {
      throw Exception("Invalid response format from server.");
    } 
    return User.fromJson(userData);
  }

  //Get current user from token
  Future<User?> getProfile() async {
    final token = await _storage.getToken();
    if (token == null) return null;

    final response = await _appClient.get('/api/auth/profile');
    return User.fromJson(response.data['user']);
  }

  //Logout
  Future<void> logout() async {
    await _storage.clearToken();
  }
}
