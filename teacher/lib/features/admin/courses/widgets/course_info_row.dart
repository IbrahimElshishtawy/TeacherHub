import 'package:flutter/material.dart';

class CourseInfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const CourseInfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  static const Color primaryBlue = Color(0xFF2F6BFF);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, size: 18, color: primaryBlue),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "$title : $value",
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
