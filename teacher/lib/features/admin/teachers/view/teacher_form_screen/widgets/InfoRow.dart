import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;

  const InfoRow({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          const SizedBox(width: 22),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Color(0xFF6B7C93),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Icon(icon, color: const Color(0xFF2F6FED), size: 20),
        ],
      ),
    );
  }
}
