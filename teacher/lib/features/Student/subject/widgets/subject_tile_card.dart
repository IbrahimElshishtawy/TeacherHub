import 'package:flutter/material.dart';

import '../state/subject_state.dart';
import 'subject_tokens.dart';

class SubjectTileCard extends StatelessWidget {
  final SubjectItem item;
  final VoidCallback onTap;

  const SubjectTileCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        decoration: BoxDecoration(
          color: SubjectTokens.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: SubjectTokens.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: SubjectTokens.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Icon(item.icon, size: 34, color: item.iconColor),
            const SizedBox(height: 10),
            Text(
              item.teacherName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF1F3CA6),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
