import 'package:flutter/material.dart';
import 'components/login_header.dart';
import 'components/login_form.dart';
import 'components/login_button.dart';

import '../../../routes/router.dart';
import '../../../routes/screen_export.dart';

import '../../../features/auth/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _handleLogin() async {
    final authProvider = context.read<AuthProvider>();

    await authProvider.login(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    if (!mounted) return;

    if (authProvider.user != null) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/entry_point',
        (Route<dynamic> route) => false,
      );
    } else if (authProvider.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${authProvider.error}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = Responsive.screenWidth(context);
    final screenHeight = Responsive.screenHeight(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06,
            vertical: screenHeight * 0.02,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.07,
              vertical: screenHeight * 0.04,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const LoginHeader(),
                LoginForm(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                LoginButton(
                  loading: context.watch<AuthProvider>().isLoading,
                  onPressed: _handleLogin, 
                ),

                SizedBox(height: screenHeight * 0.04),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signup);
                  },
                  child: Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
