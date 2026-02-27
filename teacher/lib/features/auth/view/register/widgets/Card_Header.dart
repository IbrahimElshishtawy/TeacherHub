// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const CardHeader({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF1E2D7D);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          textDirection: TextDirection.rtl,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
        ),
        const SizedBox(width: 8),
        Icon(icon, color: primary),
      ],
    );
  }
}
