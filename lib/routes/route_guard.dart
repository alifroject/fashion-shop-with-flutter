import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import 'router.dart';
import './route_constants.dart';

Future<void> checkAuthAndNavigate(State state, String route) async {
  final storage = StorageService();
  final token = await storage.getToken();

  if (!state.mounted) return; // make sure the widget is still in the tree

  if (token == null && route == entryPointScreenRoute) {
    Navigator.pushReplacementNamed(state.context, AppRoutes.login);
  } else {
    Navigator.pushReplacementNamed(state.context, route);
  }
}
