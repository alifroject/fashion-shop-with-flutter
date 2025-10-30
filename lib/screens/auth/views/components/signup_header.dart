import 'package:flutter/material.dart';
import '../../../../routes/screen_export.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Responsive.screenWidth(context);
    final screenHeight = Responsive.screenHeight(context);
    return Column(
      children: [
        Icon(
          Icons.person_add_alt_1_rounded,
          color: Theme.of(context).primaryColor,
          size: screenWidth * 0.18,
        ),
        SizedBox(height: screenHeight * 0.02),
        Text(
          'Create Account',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: Theme.of(context).primaryColor,
            fontSize: screenWidth * 0.065,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          'Join the Outfit Store community!',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[400]
                : Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: screenHeight * 0.04),
      ],
    );
  }
}
