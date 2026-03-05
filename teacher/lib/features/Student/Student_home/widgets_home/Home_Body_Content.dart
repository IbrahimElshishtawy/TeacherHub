// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/course/view/available_courses_section.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/overview/view/home_overview_big_card.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/quiz/view/available_tests_screen.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/subject/subject_actions_section.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/warning/view/warning_card.dart';

class StudentHomeBodyContent extends StatelessWidget {
  const StudentHomeBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AvailableCoursesSection(),
          SizedBox(height: 5),
          SubjectActionsSection(),
          SizedBox(height: 6),
          AvailableTestsScreen(),
          SizedBox(height: 6),
          HomeOverviewBigCard(),
          SizedBox(height: 6),
          WarningCard(),
        ],
      ),
    );
  }
}
