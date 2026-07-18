// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../state/notification_student_state.dart';

class NotificationStudentCard extends StatelessWidget {
  final StudentNotificationItem item;

  const NotificationStudentCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isHighlighted = item.highlighted;
    final background = isHighlighted ? const Color(0xFF4285F4) : Colors.white;
    final titleColor = isHighlighted ? Colors.white : const Color(0xFF1F1F1F);
    final subtitleColor = isHighlighted
        ? Colors.white.withOpacity(0.82)
        : const Color(0xFF8A8A8A);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE1E1E1)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x15000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  item.title,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.subtitle,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: subtitleColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 46,
            height: 46,
            decoration: const BoxDecoration(
              color: Color(0xFFF4F4F4),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0x16000000),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.notifications_none_rounded,
              color: Color(0xFF2F6FED),
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
