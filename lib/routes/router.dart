import 'package:flutter/material.dart';
import 'package:outfit_store/routes/route_constants.dart';
import 'screen_export.dart';

import './route_guard.dart';

class AppRoutes {
  static const login = '/login';
  static const signup = '/signup';
  static const entryPointScreenRoute = '/entry_point';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      case entryPointScreenRoute:
        return MaterialPageRoute(builder: (_) => AuthGuard(child: EntryPoint()));

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('404 Page Not Found'))),
        );
    }
  }
}
