import 'package:flutter/material.dart';
import 'screen_export.dart';
import '../../services/storage_service.dart';

class AppRoutes {
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      // Home route shows onboarding first if needed
      case home:
        return MaterialPageRoute(
          builder: (_) => const OnboardingBeforeHomeWrapper(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('404 Page Not Found'))),
        );
    }
  }
}

// Wrapper for onboarding
class OnboardingBeforeHomeWrapper extends StatefulWidget {
  const OnboardingBeforeHomeWrapper({super.key});

  @override
  State<OnboardingBeforeHomeWrapper> createState() =>
      _OnboardingBeforeHomeWrapperState();
}

class _OnboardingBeforeHomeWrapperState
    extends State<OnboardingBeforeHomeWrapper> {
  @override
  void initState() {
    super.initState();
    _checkOnboarding();
  }

  Future<void> _checkOnboarding() async {
    final storage = StorageService();
    final hasSeenOnboarding = await storage.getOnboardingSeen() ?? false;

    if (hasSeenOnboarding && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
    // Else, OnboardingScreen will be shown
  }

  @override
  Widget build(BuildContext context) {
    return const OnboardingScreen();
  }
}
