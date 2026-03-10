import 'package:flutter/material.dart';

import '../state/saved_items_state.dart';
import 'saved_items_tokens.dart';

class SavedCourseCard extends StatelessWidget {
  final SavedCourseItem item;

  const SavedCourseCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: SavedItemsTokens.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 4,
            offset: const Offset(0, 2),
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
                  style: const TextStyle(
                    color: Color(0xFF2F72E6),
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      item.dateText,
                      style: const TextStyle(
                        color: Color(0xFF6D6D6D),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(Icons.access_time_rounded, size: 16, color: Color(0xFF6D6D6D)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 142,
              height: 96,
              color: const Color(0xFF2A1B10),
              child: const Center(
                child: Icon(Icons.science_rounded, color: Colors.white70, size: 34),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
