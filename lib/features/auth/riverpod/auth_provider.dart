import 'package:flutter_riverpod/legacy.dart';
import './auth_notifier.dart';
import './auth_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);
