import 'package:flutter/material.dart';
import '../../../../routes/screen_export.dart';

class LoginButton extends StatelessWidget {
  final bool loading;
  final VoidCallback onPressed;

  const LoginButton({
    super.key,
    required this.loading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = Responsive.screenWidth(context);
    final screenHeight = Responsive.screenHeight(context);

    return SizedBox(
      width: double.infinity,

      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
        ),
        child: loading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                'Login',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
