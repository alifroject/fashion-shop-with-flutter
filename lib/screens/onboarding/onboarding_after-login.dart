import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  final VoidCallback onFinished; // Add this parameter

  const OnboardingScreen({super.key, required this.onFinished});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/fashion_onboarding.png', // replace with your image
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onFinished, // call the callback when done
            child: const Text('Continue to Home'),
          ),
        ],
      ),
    );
  }
}
