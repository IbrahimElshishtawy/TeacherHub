// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const NavButton({super.key, required this.icon, required this.onTap});

  static const Color _blue = Color(0xFF2F6BFF);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 38,
        height: 32,
        decoration: BoxDecoration(
          color: _blue.withOpacity(0.10),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _blue),
        ),
        child: Icon(icon, color: _blue, size: 18),
      ),
    );
  }
}
