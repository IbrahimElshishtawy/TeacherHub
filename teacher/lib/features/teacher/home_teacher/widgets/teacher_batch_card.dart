import 'package:flutter/material.dart';

class TeacherBatchCard extends StatelessWidget {
  final String title;
  final String stage;
  final int studentsCount;
  final String nextSession;

  const TeacherBatchCard({
    super.key,
    required this.title,
    required this.stage,
    required this.studentsCount,
    required this.nextSession,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(left: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7FB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            stage,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.people_outline, size: 16, color: Color(0xFF2F6BFF)),
              const SizedBox(width: 4),
              Text(
                "$studentsCount طالب",
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.schedule_outlined, size: 16, color: Color(0xFFFF9800)),
              const SizedBox(width: 4),
              Text(
                nextSession,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
