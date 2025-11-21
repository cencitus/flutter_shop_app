import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const double _fieldWidth = 370;
  static const double _fieldHeight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildTitleText(),
          _buildForm(context),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned(
      top: -205.67,
      left: -131.97,
      child: Image.asset(
        'assets/images/background.png',
        width: 659.33,
        height: 513.44,
      ),
    );
  }

  Widget _buildTitleText() {
    return const Positioned(
      top: 122,
      left: 30,
      child: Text(
        'Create\nAccount',
        style: TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w700,
          fontSize: 50,
          height: 54 / 50,
          letterSpacing: -0.5,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Positioned(
      top: 430,
      left: 0,
      right: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildEmailField(),
          const SizedBox(height: 15),
          _buildPasswordField(),
          const SizedBox(height: 15),
          _buildPhoneField(),
          const SizedBox(height: 60),
          _buildSubmitButton(context),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return Container(
      width: _fieldWidth,
      height: _fieldHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'E-mail',
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 13.83,
            color: Color(0xFFD2D2D2),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 22),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      width: _fieldWidth,
      height: _fieldHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          border: InputBorder.none,
          hintStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 13.83,
            color: Color(0xFFD2D2D2),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/icons/eye_hide.png',
              width: 24,
              height: 24,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 22),
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return Container(
      width: _fieldWidth,
      height: _fieldHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Image.asset('assets/icons/flag.png', width: 35, height: 35),
          const SizedBox(width: 8),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Your number',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 13.83,
                  color: Color(0xFFD2D2D2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return SizedBox(
      width: 370,
      height: 70,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF004CFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Done',
          style: TextStyle(
            fontFamily: 'Nunito Sans',
            fontWeight: FontWeight.w300,
            fontSize: 22,
            height: 31 / 22,
            color: Color(0xFFF3F3F3),
          ),
        ),
      ),
    );
  }
}
