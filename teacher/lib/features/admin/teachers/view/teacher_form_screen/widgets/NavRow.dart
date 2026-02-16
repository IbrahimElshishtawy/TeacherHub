import 'package:flutter/material.dart';

class NavRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const NavRow({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            const Icon(Icons.chevron_left, color: Color(0xFF2F6FED), size: 22),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1E2A3B),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(icon, color: const Color(0xFF2F6FED), size: 22),
          ],
        ),
      ),
    );
  }
}
