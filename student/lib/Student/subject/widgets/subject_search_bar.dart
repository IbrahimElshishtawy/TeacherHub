// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'subject_tokens.dart';

class SubjectSearchBar extends StatelessWidget {
  final String hintText;

  const SubjectSearchBar({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: SubjectTokens.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: SubjectTokens.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFFB1B1B1),
            fontSize: 14,
          ),
          suffixIcon: const Icon(
            Icons.search_rounded,
            color: Color(0xFFB1B1B1),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
      ),
    );
  }
}
