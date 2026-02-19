// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CourseStatusPill extends StatelessWidget {
  final bool isActive;
  const CourseStatusPill({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final text = isActive ? "نشط" : "موقوف";
    final fg = isActive ? const Color(0xFF19B66A) : const Color(0xFFE53935);
    final bg = isActive ? const Color(0xFFE9F8F0) : const Color(0xFFFFEBEE);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: fg.withOpacity(0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: fg, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: fg,
              fontWeight: FontWeight.w900,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
