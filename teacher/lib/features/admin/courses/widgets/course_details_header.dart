import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state/courses_state.dart';

class CourseDetailsHeader extends StatelessWidget {
  final CourseModel course;

  const CourseDetailsHeader({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 240,
          width: double.infinity,
          child: course.coverUrl.isEmpty
              ? Container(
                  color: const Color(0xFF1E2A3B),
                  child: const Center(
                    child: Icon(
                      Icons.image_outlined,
                      color: Colors.white54,
                      size: 56,
                    ),
                  ),
                )
              : Image.network(course.coverUrl, fit: BoxFit.cover),
        ),

        // Back
        Positioned(
          top: 10,
          left: 10,
          child: InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.25),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),

        // Status (نشط/موقوف)
        Positioned(
          top: 14,
          right: 14,
          child: _CourseStatusPill(isActive: course.isActive),
        ),

        // Title + subtitle overlay
        Positioned(
          left: 14,
          right: 14,
          bottom: 14,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "شرح لمحتوى الكورس",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CourseStatusPill extends StatelessWidget {
  final bool isActive;
  const _CourseStatusPill({required this.isActive});

  @override
  Widget build(BuildContext context) {
    final text = isActive ? "نشط" : "موقوف";
    final fg = isActive ? const Color(0xFF19B66A) : const Color(0xFFE53935);
    final bg = isActive ? const Color(0xFFE9F8F0) : const Color(0xFFFFEBEE);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: fg.withOpacity(0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: fg, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: fg,
              fontWeight: FontWeight.w900,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
