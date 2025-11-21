import 'package:flutter/material.dart';
import 'signup_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()),
            );
          },
          child: Image.asset(
            'assets/images/logo.png',
            width: 330,
            height: 330,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
