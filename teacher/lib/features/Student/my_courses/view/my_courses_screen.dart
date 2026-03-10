import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/my_courses_controller.dart';
import '../widgets/my_course_card.dart';
import '../widgets/my_courses_header.dart';
import '../widgets/my_courses_tokens.dart';

class MyCoursesScreen extends GetView<MyCoursesController> {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = controller.state.value;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: MyCoursesTokens.pageBg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              children: [
                MyCoursesHeader(
                  title: state.title,
                  subtitle: state.subtitle,
                  onBack: controller.backToHome,
                ),
                const SizedBox(height: 18),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.courses.length,
                    itemBuilder: (_, index) {
                      final course = state.courses[index];
                      return MyCourseCard(
                        item: course,
                        onTap: () => controller.openCourse(course),
                      );
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
