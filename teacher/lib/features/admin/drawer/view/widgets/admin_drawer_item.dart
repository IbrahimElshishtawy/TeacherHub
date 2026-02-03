// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AdminDrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool selected;

  const AdminDrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = selected ? Colors.white : Colors.white.withOpacity(0.92);
    final iconColor = selected ? Colors.white : Colors.white.withOpacity(0.88);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: selected ? Colors.white.withOpacity(0.08) : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: textColor,
                fontSize: 16.5,
                fontWeight: selected ? FontWeight.w800 : FontWeight.w700,
              ),
            ),
            const SizedBox(width: 12),
            Icon(icon, color: iconColor, size: 22),
          ],
        ),
      ),
    );
  }
}
