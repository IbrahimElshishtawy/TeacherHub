import 'package:flutter/material.dart';

import '../state/subject_state.dart';
import 'subject_image_tile.dart';
import 'subject_tokens.dart';

class SubjectLessonCard extends StatelessWidget {
  final SubjectLessonItem item;
  final VoidCallback onTap;

  const SubjectLessonCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7F8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            SubjectImageTile(
              style: item.imageStyle,
              width: 160,
              height: 92,
              bottomBar: Container(height: 4, color: SubjectTokens.red),
              bottomLeft: Text(
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
                      color: SubjectTokens.textPrimary,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: SubjectTokens.textPrimary,
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
                          color: SubjectTokens.textSecondary,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.access_time_rounded,
                        size: 14,
                        color: SubjectTokens.textSecondary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
