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
          padding: const EdgeInsets.symmetric(horizontal: 8),
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "الكورسات",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "عرض جميع الكورسات المتاحة وتعديل بياناتها بسهولة",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: controller.assignVideoListToBatch,
                      icon: const Icon(Icons.share_outlined, size: 18),
                      label: const Text(
                        "إسناد لدفعة",
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6A1BB2),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
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
