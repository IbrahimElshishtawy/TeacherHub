// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/courses/widgets/CourseStatus_Pill.dart';
import '../state/courses_state.dart';

class CourseDetailsHeader extends StatelessWidget {
  final ContentModel course;

  const CourseDetailsHeader({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 280,
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
          top: 16,
          left: 16,
          child: InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(22, 0, 0, 0).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 15,
          child: CourseStatusPill(isActive: course.isActive),
        ),

        Positioned(
          left: 50,
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
