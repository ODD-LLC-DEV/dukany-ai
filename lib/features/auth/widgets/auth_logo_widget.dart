import 'package:flutter/material.dart';

class AuthLogoWidget extends StatelessWidget {
  const AuthLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFB8E34B),
            width: 10,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
