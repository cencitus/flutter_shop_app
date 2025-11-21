import 'package:flutter/material.dart';
import 'shop_main_screen.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  static const double _fieldWidth = 370;
  static const double _fieldHeight = 60;
  static const double _buttonWidth = 370;
  static const double _buttonHeight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackground(),
          _buildGreetingText(),
          _buildSubtitleText(),
          _buildPasswordField(),
          _buildStartButton(context),
          _buildCancelButton(context),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Positioned(
      top: -171.67,
      left: -158.44,
      child: Image.asset(
        'assets/images/password_back.png',
        width: 533.91,
        height: 550.34,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildGreetingText() {
    return const Positioned(
      top: 282,
      left: 148,
      child: Text(
        'Hello!',
        style: TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w700,
          fontSize: 28,
          height: 36 / 28,
          letterSpacing: -0.28,
          color: Color(0xFF202020),
        ),
      ),
    );
  }

  Widget _buildSubtitleText() {
    return const Positioned(
      top: 348,
      left: 104,
      child: Text(
        'Type your password',
        style: TextStyle(
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w300,
          fontSize: 19,
          height: 35 / 19,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Positioned(
      top: 500,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
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
              contentPadding: const EdgeInsets.symmetric(vertical: 22),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  'assets/icons/eye_hide.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return Positioned(
      top: 650,
      left: 0,
      right: 0,
      child: Center(
        child: SizedBox(
          width: _buttonWidth,
          height: _buttonHeight,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ShopMainScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF004CFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              minimumSize: const Size(335, 61),
            ),
            child: const Text(
              'Start',
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w300,
                fontSize: 22,
                color: Color(0xFFF3F3F3),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return Positioned(
      top: 725,
      left: 0,
      right: 0,
      child: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontFamily: 'Nunito Sans',
              fontWeight: FontWeight.w300,
              fontSize: 15,
              height: 26 / 15,
              letterSpacing: 0,
              color: Color(0xFF202020),
            ),
          ),
        ),
      ),
    );
  }
}
