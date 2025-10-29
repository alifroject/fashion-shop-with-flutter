import "package:flutter/material.dart";

// ------------------- COLORS -------------------
class AppColors {
  static const primary = Color(0xFF1E88E5);
  static const secondary = Color(0xFFD32F2F);
  static const background = Color(0xFFF5F5F5);
  static const textPrimary = Color(0xFF212121);
  static const textSecondary = Color(0xFF757575);
}

// ------------------- STRINGS -------------------
class AppString {
  static const appName = "Outfit Store";
  static const welcome = "Welcome to Outfit Store!";
  static const loginError = "Invalid email or password";
  static const signupError = "Signup failed. Try again.";
}

// ------------------- SIZES -------------------
class AppSizes {
  static const padding = 16.0;
  static const margin = 16.0;
  static const borderRadius = 12.0;
  static const iconSize = 24.0;
}

// ------------------- API -------------------
class ApiConstants {
  static const baseUrl = "http://localhost:3006/";
  static const loginEndpoint = "auth/login";
  static const signupEndpoint = "auth/signup";
}
