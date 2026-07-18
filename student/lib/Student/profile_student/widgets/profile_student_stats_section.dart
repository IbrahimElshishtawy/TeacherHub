import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/Student/profile_student/controller/profile_student_controller.dart';
import 'package:teacher/features/Student/profile_student/widgets/profile_student_info_tile.dart';
import 'package:teacher/features/Student/profile_student/widgets/profile_student_section_card.dart';

class ProfileStudentStatsSection extends StatelessWidget {
  const ProfileStudentStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileStudentController>();

    return Obx(() {
      final data = controller.state.value;

      return ProfileStudentSectionCard(
        title: 'نشاطي التعليمي',
        subtitle: 'تتبع تقدمك ومستواك الدراسي الحالي.',
        child: Column(
          children: [
            ProfileStudentInfoTile(
              title: data.totalCourses,
              icon: Icons.ondemand_video_outlined,
              onTap: () {},
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFE6EAF2)),
            ProfileStudentInfoTile(
              title: data.completedExams,
              icon: Icons.assignment_turned_in_outlined,
              onTap: () {},
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFE6EAF2)),
            ProfileStudentInfoTile(
              title: data.attendanceRate,
              icon: Icons.pie_chart_outline_rounded,
              onTap: () {},
            ),
          ],
        ),
      );
    });
  }
}
