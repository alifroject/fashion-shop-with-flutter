import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import 'app_routes.dart';

Future<void> checkAuthAndNavigate(BuildContext context, String route) async {
  final storage = StorageService();
  final token = await storage.getToken();
  if (token == null && route == AppRoutes.home) {
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  } else {
    Navigator.pushReplacementNamed(context, route);
  }
}
