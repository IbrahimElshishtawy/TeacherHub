// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/Student/Student_home/data/course_card_model.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/course/view/available_courses_section.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/overview/view/home_overview_big_card.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/quiz/view/available_tests_screen.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/subject/subject_actions_section.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/warning/view/warning_card.dart';
import 'package:teacher/features/Student/subject/state/subject_state.dart';

class StudentHomeBodyContent extends StatelessWidget {
  const StudentHomeBodyContent({super.key});

  SubjectItem _toSubjectItem(CourseCardModel course) {
    return SubjectItem(
      id: course.id,
      title: course.title,
      teacherName: 'اسم المدرس',
      icon: Icons.menu_book_rounded,
      iconColor: const Color(0xFF3B82F6),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvailableCoursesSection(
            onViewAll: () => Get.toNamed('/courses'),
            onEnter: (course) => Get.toNamed(
              '/courses/details',
              arguments: _toSubjectItem(course),
            ),
            onContinue: (course) => Get.toNamed(
              '/courses/details',
              arguments: _toSubjectItem(course),
            ),
            onSubscribe: (course) => Get.toNamed(
              '/courses/details',
              arguments: _toSubjectItem(course),
            ),
          ),
          SizedBox(height: 5),
          const SubjectActionsSection(),
          SizedBox(height: 6),
          const AvailableTestsScreen(),
          SizedBox(height: 6),
          const HomeOverviewBigCard(),
          SizedBox(height: 6),
          const WarningCard(),
        ],
      ),
    );
  }
}
