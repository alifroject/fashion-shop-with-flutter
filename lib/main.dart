// ---------------------- FULL APP SETUP ----------------------
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/provider/auth_provider.dart'; // widget is dealing with provider while providing is communicating with service
import 'routes/router.dart';
import 'core/theme.dart';

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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // auto switch
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.login,
    );
  }
}

// ---------------------- UNIT TEST / SINGLE PAGE RUN ----------------------
// Uncomment this section to run any page independently for quick testing

// import 'package:flutter/material.dart';
// import './routes/screen_export.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginScreen(), // Change to test another page manually
//     ),
//   );
// }

