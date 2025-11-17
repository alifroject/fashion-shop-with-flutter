import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:outfit_store/screens/auth/views/components/signup_button.dart';
import '../../../routes/router.dart';
import '../../../routes/screen_export.dart';

// from components
import '../views/components/signup_header.dart';
import '../views/components/signup_form.dart';

//provider
import '../../../features/auth/riverpod/auth_provider.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  Future<void> _signup() async {
    await ref
        .read(authProvider.notifier)
        .signup(
          _firstNameController.text.trim(),
          _lastNameController.text.trim(),
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
    if (!mounted) return;

    final auth = ref.read(authProvider);

    if (auth.error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(auth.error!)));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Signup successful! Please log in.')),
    );
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = Responsive.screenWidth(context);
    final screenHeight = Responsive.screenHeight(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(screenWidth * 0.06),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06,
              vertical: screenHeight * 0.04,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SignupHeader(),
                SignupForm(
                  firstNameController: _firstNameController,
                  lastNameController: _lastNameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                SignupButton(loading: _loading, onPressed: _signup),
                SizedBox(height: screenHeight * 0.02),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  },
                  child: Text(
                    "Already have an account? Login",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
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
