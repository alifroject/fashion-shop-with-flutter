import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/provider/auth_provider.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Outfit Store',
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.login,
    );
  }
}
