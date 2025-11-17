import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/auth/riverpod/auth_provider.dart';
import './router.dart';

class AuthGuard extends ConsumerStatefulWidget  {
  final Widget child;

  const AuthGuard({super.key, required this.child});

  @override
  ConsumerState<AuthGuard> createState() => _AuthGuardState();
}

class _AuthGuardState extends ConsumerState<AuthGuard> {
  @override
  Widget build(BuildContext context) {
    final auth =  ref.watch(authProvider);

    if (auth.user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }
      });
      return const SizedBox.shrink();
    }
    return widget.child;
  }
}
