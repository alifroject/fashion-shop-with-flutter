import '../../../models/user_model.dart';

class AuthState {
  final User? user;
  final bool isLoading;
  final String? error;

  const AuthState({this.user, this.isLoading = false, this.error});

  AuthState copyWith({User? user, bool? isLoading, String? error}) {
    return AuthState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }
}
