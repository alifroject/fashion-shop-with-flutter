import 'package:flutter/material.dart';
import 'screen_export.dart';
import '../../services/storage_service.dart';
import './route_constants.dart';

class AppRoutes {
  static const login = '/login';
  static const signup = '/signup';
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      case entryPointScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('404 Page Not Found'))),
        );
    }
  }
}

