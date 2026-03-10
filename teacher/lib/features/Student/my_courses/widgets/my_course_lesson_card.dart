import 'package:flutter/material.dart';

import '../state/my_courses_state.dart';
import 'my_courses_image_tile.dart';
import 'my_courses_tokens.dart';

class MyCourseLessonCard extends StatelessWidget {
  final MyCourseLessonItem item;

  const MyCourseLessonCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7F8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          MyCoursesImageTile(
            style: item.imageStyle,
            width: 160,
            height: 92,
            bottomBar: Container(
              height: 4,
              color: MyCoursesTokens.red,
            ),
            bottomLeftOverlay: Text(
              item.duration,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  item.title,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: MyCoursesTokens.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: MyCoursesTokens.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      item.dateText,
                      style: const TextStyle(
                        color: MyCoursesTokens.textSecondary,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.access_time_rounded,
                      size: 14,
                      color: MyCoursesTokens.textSecondary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
