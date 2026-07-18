import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/my_courses_controller.dart';
import '../state/my_courses_state.dart';
import '../widgets/my_course_lesson_card.dart';
import '../widgets/my_courses_header.dart';
import '../widgets/my_courses_tokens.dart';

class MyCourseDetailsScreen extends GetView<MyCoursesController> {
  const MyCourseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = controller.state.value;
    final course = Get.arguments as MyCourseItem?;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: MyCoursesTokens.pageBg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                MyCoursesHeader(
                  title: state.title,
                  subtitle:
                      'قائمة الدروس والفيديوهات التعليمية المتاحة في هذا الكورس',
                  onBack: () => Get.back(),
                ),
                if (course != null) ...[
                  const SizedBox(height: 6),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      course.title,
                      style: const TextStyle(
                        color: MyCoursesTokens.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.lessons.length,
                    itemBuilder: (_, index) {
                      return MyCourseLessonCard(item: state.lessons[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
