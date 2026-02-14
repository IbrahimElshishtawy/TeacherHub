import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String label;
  final String description;

  const Labels({super.key, required this.label, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Color(0xFF1E2A3B),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Text(
          description,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: Color(0xFF6B7C93),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
