import 'package:shared_preferences/shared_preferences.dart'; //Store users preferences such as token or small piece of data

class StorageService {
  static const _tokenkey = "auth_token";

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenkey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenkey);
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenkey);
  }
}
