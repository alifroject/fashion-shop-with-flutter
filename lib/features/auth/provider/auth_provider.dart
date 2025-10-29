import 'package:flutter/material.dart';
import '../../auth/data/auth_service.dart';
import '../../../models/user_model.dart';

//Provider is used for:
// The current user object
//Loading/error state during API calls

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;
  bool _isLoading = false;
  String? _error;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final loggedInUser = await _authService.login(email, password);
      _user = loggedInUser;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> signup(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final newUser = await _authService.signup(
        firstName,
        lastName,
        email,
        password,
      );
      _user = newUser;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
