import 'package:flutter/material.dart';

import '../state/my_courses_state.dart';
import 'my_courses_image_tile.dart';
import 'my_courses_tokens.dart';

class MyCourseCard extends StatelessWidget {
  final MyCourseItem item;
  final VoidCallback onTap;

  const MyCourseCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: MyCoursesTokens.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyCoursesTokens.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              MyCoursesImageTile(
                style: item.imageStyle,
                width: 140,
                height: 96,
                bottomLeftOverlay: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    item.lessonsCount,
                    style: const TextStyle(
                      color: MyCoursesTokens.textPrimary,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      item.title,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: MyCoursesTokens.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: MyCoursesTokens.textPrimary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 8),
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
        ),
      ),
    );
  }
}
