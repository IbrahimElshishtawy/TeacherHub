import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/teachers/widgets/bottom_new_teacher.dart';
import 'package:teacher/features/admin/teachers/widgets/massage_create_teacher.dart';
import 'package:teacher/features/admin/teachers/widgets/teacher_card.dart';

import '../controller/teacher_account_controller.dart';

class TeacherAccountScreen extends GetView<TeacherAccountController> {
  const TeacherAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFB0202A)),
          onPressed: () => Get.back(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'حساب المدرس',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
                color: const Color(0xFF1E2A3B),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'إدارة بيانات وأمان حساب المدرس',
              style: theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF6B7C93),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Column(
            children: [
              // List of Teacher Cards
              Obx(() {
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.teachers.length, // Number of teachers
                    itemBuilder: (context, index) {
                      final teacher = controller.teachers[index];
                      return CardTeacher(
                        fullName: teacher.fullName,
                        email: teacher.email,
                        stageLabel: teacher.stageLabel,
                        createdAtLabel: teacher.createdAtLabel,
                        avatarUrl: teacher.avatarUrl,
                        isActive: teacher.isActive,
                        onEditData: controller.onEditData,
                        onPermissions: controller.onPermissions,
                        onAnalytics: controller.onAnalytics,
                      );
                    },
                  ),
                );
              }),

              // Button to Create New Teacher Account
              const SizedBox(height: 20),
              BottomNewTeacher(
                onPress: () {
                  // Your onPress logic to show the create teacher dialog
                  showCreateTeacherDialog(context);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
