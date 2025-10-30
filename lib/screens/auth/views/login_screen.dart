import 'package:flutter/material.dart';
import '../../../features/auth/data/auth_service.dart';
import '../../../routes/router.dart';
import '../../../routes/screen_export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  Future<void> _login() async {
    setState(() => _loading = true);
    try {
      final result = await AuthService().login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Welcome ${result.firstName}!')));
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login failed: $e')));
    } finally {
      setState(() => _loading = false);
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
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    labelText: 'Email',
                    filled: true,
                    fillColor:
                        Theme.of(context).inputDecorationTheme.fillColor ??
                        Theme.of(context).colorScheme.surfaceVariant,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    labelText: 'Password',
                    filled: true,
                    fillColor:
                        Theme.of(context).inputDecorationTheme.fillColor ??
                        Theme.of(context).colorScheme.surfaceVariant,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    child: _loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Login',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
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
