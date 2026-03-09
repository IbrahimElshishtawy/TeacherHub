// ignore_for_file: camel_case_types, file_names, deprecated_member_use

import 'package:flutter/material.dart';

class teacherDrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool selected;

  const teacherDrawerItem({
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor, size: 22),
            const SizedBox(width: 12),
            Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: textColor,
                fontSize: 16.5,
                fontWeight: selected ? FontWeight.w800 : FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
