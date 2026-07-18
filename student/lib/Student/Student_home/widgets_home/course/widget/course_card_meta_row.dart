// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CourseCardMetaRow extends StatelessWidget {
  final String scheduleText;
  final String lessonsText;

  const CourseCardMetaRow({
    super.key,
    required this.scheduleText,
    required this.lessonsText,
  });

  @override
  Widget build(BuildContext context) {
    final muted = Colors.black.withOpacity(.55);

    return Row(
      children: [
        Icon(Icons.access_time_rounded, size: 15, color: muted),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            scheduleText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: muted,
              fontWeight: FontWeight.w600,
              fontSize: 11.5,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5FF),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: const Color(0xFF2F80ED).withOpacity(.15)),
          ),
          child: Text(
            lessonsText,
            style: const TextStyle(
              color: Color(0xFF2F80ED),
              fontWeight: FontWeight.w900,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}
