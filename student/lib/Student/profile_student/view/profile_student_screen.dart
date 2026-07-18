import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/Student/profile_student/controller/profile_student_controller.dart';
import 'package:student/Student/profile_student/state/profile_student_state.dart';
import 'package:student/Student/profile_student/widgets/profile_student_header.dart';
import 'package:student/Student/profile_student/widgets/profile_student_info_tile.dart';
import 'package:student/Student/profile_student/widgets/profile_student_section_card.dart';
import 'package:student/Student/profile_student/widgets/profile_student_stats_section.dart';

class ProfileStudentScreen extends StatelessWidget {
  const ProfileStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileStudentController>();

    return Scaffold(
      backgroundColor: ProfileStudentTheme.scaffold,
      body: Column(
        children: [
          const ProfileStudentHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 18, bottom: 24),
              child: Column(
                children: [
                  Obx(() {
                    final data = controller.state.value;
                    return ProfileStudentSectionCard(
                      title: 'البيانات الشخصية',
                      subtitle: 'إدارة معلوماتك الأساسية وتفاصيل الحساب.',
                      child: Column(
                        children: [
                          ProfileStudentInfoTile(
                            title: data.studentName,
                            icon: Icons.perm_identity_outlined,
                            onTap: () {},
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Color(0xFFE6EAF2),
                          ),
                          ProfileStudentInfoTile(
                            title: data.email,
                            icon: Icons.mail_outline_rounded,
                            onTap: () {},
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Color(0xFFE6EAF2),
                          ),
                          ProfileStudentInfoTile(
                            title: data.phone,
                            icon: Icons.phone_in_talk_outlined,
                            onTap: () {},
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Color(0xFFE6EAF2),
                          ),
                          ProfileStudentInfoTile(
                            title: data.parentPhone,
                            icon: Icons.phone_callback_outlined,
                            onTap: () {},
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Color(0xFFE6EAF2),
                          ),
                          ProfileStudentInfoTile(
                            title: data.grade,
                            icon: Icons.school_outlined,
                            onTap: () {},
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Color(0xFFE6EAF2),
                          ),
                          ProfileStudentInfoTile(
                            title: data.joinDate,
                            icon: Icons.calendar_today_outlined,
                            onTap: () {},
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 14),
                  const ProfileStudentStatsSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
