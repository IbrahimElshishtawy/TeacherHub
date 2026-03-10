import 'package:flutter/material.dart';

import '../state/subject_state.dart';
import 'subject_image_tile.dart';
import 'subject_tokens.dart';

class SubjectCourseCard extends StatelessWidget {
  final SubjectCourseItem item;

  const SubjectCourseCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: SubjectTokens.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: SubjectTokens.border),
      ),
      child: Column(
        children: [
          SubjectImageTile(
            style: item.imageStyle,
            width: double.infinity,
            height: 120,
          ),
          const SizedBox(height: 8),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: SubjectTokens.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.progressLabel,
            style: const TextStyle(
              color: SubjectTokens.blue,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            item.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: SubjectTokens.textPrimary,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: SubjectTokens.blue,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'متابعة التقدّم في الكورس',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
