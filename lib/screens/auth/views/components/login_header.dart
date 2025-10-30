import 'package:flutter/material.dart';
import '../../../../routes/screen_export.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = Responsive.screenWidth(context);
    final screenHeight = Responsive.screenHeight(context);

    return Column(
      children: [
        Icon(
          Icons.lock_outline_rounded,
          color: Theme.of(context).primaryColor,
          size: screenWidth * 0.18,
        ),
        SizedBox(height: screenHeight * 0.02),
        Text(
          'Welcome Back!',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: Theme.of(context).primaryColor,
            fontSize: screenWidth * 0.065,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          'Login to continue to Outfit Store',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: screenHeight * 0.04),
      ],
    );
  }
}
