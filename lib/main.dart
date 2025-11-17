// // ---------------------- FULL APP SETUP ----------------------
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/provider/auth_provider.dart'; // widget is dealing with provider while providing is communicating with service
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/auth/provider/navigation_provider.dart';
import 'routes/router.dart';
import 'core/theme.dart';

void main() {
  runApp(
    ProviderScope( // =====================> Using riverpod package
      child: const MyApp(),
      // child: MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(create: (_) => AuthProvider()),
      //     // ChangeNotifierProvider(create: (_) => NavigationProvider()),
      //   ],

      //   child: const MyApp(),
      // ),================================> Using provider package
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
// import './learn_widget.dart';
// import './createWidget.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // home: LoginScreen(), // Change to test another page manually
//       home: CreateWidget(), // Change to test another page manually
//     ),
//   );
// }
