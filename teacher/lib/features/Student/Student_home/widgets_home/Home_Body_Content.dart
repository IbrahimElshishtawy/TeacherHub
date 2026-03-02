// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/course/view/available_courses_section.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/quiz/view/available_tests_screen.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/subject/subject_actions_section.dart';

class StudentHomeBodyContent extends StatelessWidget {
  const StudentHomeBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(2, 0, 3, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvailableCoursesSection(),

          const SizedBox(height: 6),
          const SubjectActionsSection(),
          const SizedBox(height: 6),
          AvailableTestsScreen(),
        ],
      ),
    );
  }
}
