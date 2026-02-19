import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/courses_controller.dart';
import '../widgets/courses_header.dart';
import '../widgets/course_card.dart';
import '../widgets/courses_search_filter_row.dart';

class CoursesScreen extends GetView<CoursesController> {
  const CoursesScreen({super.key});

  static const Color bg = Color(0xFFF6F7FB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Obx(() {
            final courses = controller.filteredCourses;

            return ListView(
              children: [
                const CoursesHeader(),
                const SizedBox(height: 12),

                CoursesSearchFilterRow(
                  onChanged: controller.setQuery,
                  onFilter: controller.openFilter,
                ),
                const SizedBox(height: 12),

                const Text(
                  "الكورسات",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 10),

                ...courses.map(
                  (c) => CourseCard(
                    course: c,
                    onTap: () => controller.openDetails(c),
                  ),
                ),

                const SizedBox(height: 18),
              ],
            );
          }),
        ),
      ),
    );
  }
}
