import 'package:outfit_store/models/user_model.dart'; //user model for User
import '../../../../../services/api_client.dart';
import '../../../../../services/storage_service.dart';

//handle authentication logic such as login, signup, logout, and get profile

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
    final response = await _appClient.post('/signup', {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    });
    print('Signup Response: ${response.data}');
    final userJson = response.data;
    return User.fromJson(userJson);
  }

  //Login
  Future<User> login(String email, String password) async {
    final response = await _appClient.post("/login", {
      'email': email,
      'password': password,
    });

    final data = response.data as Map<String, dynamic>;
    final token = data['token'] as String?;
    final userData = data['user'] as Map<String, dynamic>?;

    if (token == null || userData == null) {
      throw Exception("Invalid response format from server.");
    }

    print(response.data);
    await _storage.saveToken(token); //get token
    return User.fromJson(userData);
  }

  //Get current user from token
  Future<User?> getProfile() async {
    final token = await _storage.getToken();
    if (token == null) return null;

    final response = await _appClient.get('/api/auth/profile', auth: true);
    return User.fromJson(response.data);
  }

  //Logout
  Future<void> logout() async {
    await _storage.clearToken();
    _appClient.clearAuthHeader();
  }
}
