import 'package:flutter/material.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/course/view/available_courses_section.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/quiz/view/available_tests_screen.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/subject/subject_actions_section.dart';

class StudentHomeBodyContent extends StatelessWidget {
  const StudentHomeBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          2,
          0,
          2,
          2,
        ), // إضافة padding لتوزيع المسافة بشكل صحيح
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section for available courses
            const AvailableCoursesSection(),

            const SizedBox(height: 16), // زيادة المسافة بين الأقسام
            // Section for subject actions
            const SubjectActionsSection(),

            const SizedBox(height: 16), // زيادة المسافة بين الأقسام
            // Section for available tests wrapped with ConstrainedBox to avoid unbounded size
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 600,
              ), // تحديد حد أقصى للارتفاع
              child: AvailableTestsScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
