import 'package:flutter/material.dart';

import '../state/saved_items_state.dart';

class SubscribedLessonCard extends StatelessWidget {
  final SubscribedLessonItem item;

  const SubscribedLessonCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F6F8),
        borderRadius: BorderRadius.circular(8),
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
                  style: const TextStyle(
                    color: Color(0xFF1F1F1F),
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                ),
                Text(
                  item.subtitle,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFF4A4A4A),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      item.dateText,
                      style: const TextStyle(
                        color: Color(0xFF7A7A7A),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.access_time_rounded, size: 16, color: Color(0xFF7A7A7A)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  width: 160,
                  height: 96,
                  color: const Color(0xFF98A3AF),
                  child: const Center(
                    child: Icon(Icons.biotech_rounded, color: Colors.white70, size: 30),
                  ),
                ),
                Container(
                  width: 160,
                  height: 4,
                  color: const Color(0xFFF14C54),
                ),
                Positioned(
                  left: 8,
                  bottom: 8,
                  child: Text(
                    item.duration,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
