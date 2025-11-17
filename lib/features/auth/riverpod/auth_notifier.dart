import 'package:flutter_riverpod/legacy.dart';
import '../../auth/data/auth_service.dart';
import './auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService = AuthService();
  AuthNotifier() : super(const AuthState());
  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final loggedInUser = await _authService.login(email, password);
      state = state.copyWith(user: loggedInUser);
    } catch (e) {
      state = state.copyWith(error: e.toString().replaceAll('Exception: ', ''));
    }

    state = state.copyWith(isLoading: false);
  }

  Future<void> signup(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final newUser = await _authService.signup(
        firstName,
        lastName,
        email,
        password,
      );
      state = state.copyWith(user: newUser);
    } catch (e) {
      state = state.copyWith(error: e.toString().replaceAll('Exception: ', ''));
    }

    state = state.copyWith(isLoading: false);
  }

  Future<void> logout() async {
    state = const AuthState();
  }
}
