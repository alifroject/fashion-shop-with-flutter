import 'package:flutter/material.dart';
import '../../../../routes/screen_export.dart';

class SignupForm extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignupForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = Responsive.screenWidth(context);
    final screenHeight = Responsive.screenHeight(context);
    final isDark = theme.brightness == Brightness.dark;

    InputDecoration inputDecoration(String label, IconData icon) {
      return InputDecoration(
        prefixIcon: Icon(icon, color: theme.colorScheme.primary),
        labelText: label,
        labelStyle: TextStyle(
          color: isDark ? Colors.white70 : Colors.black87,
          fontSize: screenWidth * 0.04,
        ),
        filled: true,
        fillColor: isDark ? Colors.grey[850] : theme.colorScheme.surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.04,
        ),
      );
    }

    return Column(
      children: [
        TextField(
          controller: firstNameController,
          decoration: inputDecoration('First Name', Icons.person_outline),
        ),
        SizedBox(height: screenHeight * 0.02),
        TextField(
          controller: lastNameController,
          decoration: inputDecoration('Last Name', Icons.person_outline),
        ),
        SizedBox(height: screenHeight * 0.02),
        TextField(
          controller: emailController,
          decoration: inputDecoration('Email', Icons.email_outlined),
        ),
        SizedBox(height: screenHeight * 0.02),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: inputDecoration('Password', Icons.lock_outline),
        ),
        SizedBox(height: screenHeight * 0.04),
      ],
    );
  }
}
