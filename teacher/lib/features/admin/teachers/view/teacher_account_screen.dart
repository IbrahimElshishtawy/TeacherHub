import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/teachers/controller/teacher_account_controller.dart';
import 'package:teacher/features/admin/teachers/controller/teacher_form_controller.dart';
import 'package:teacher/features/admin/teachers/widgets/massage_create_teacher.dart';
import 'package:teacher/features/admin/teachers/widgets/teacher_card.dart';
import 'package:teacher/features/admin/teachers/widgets/bottom_new_teacher.dart';

class TeacherAccountScreen extends GetView<TeachersController> {
  const TeacherAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final form = Get.find<TeacherFormController>();

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
              Expanded(
                child: Obx(() {
                  final list = controller.teachers;

                  if (list.isEmpty) {
                    return const Center(
                      child: Text(
                        'لا يوجد مدرسين حتى الآن',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.only(bottom: 12),
                    itemCount: list.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final teacher = list[index];

                      return CardTeacher(
                        fullName: teacher.fullName,
                        email: teacher.email,
                        stageLabel: teacher.stages.isEmpty
                            ? '—'
                            : teacher.stages.join(' • '),

                        createdAtLabel: teacher.createdAt,
                        avatarUrl: teacher.avatarPath,
                        isActive: teacher.isActive,
                        onEditData: () {
                          form.startEdit(teacher.id);
                          Get.toNamed('/teacher-form');
                        },
                        onPermissions: () {
                          form.startEdit(teacher.id);
                          Get.toNamed('/teacher-permissions');
                        },
                        onAnalytics: () {
                          Get.toNamed(
                            '/teacher-analytics',
                            arguments: teacher.id,
                          );
                        },
                        onToggleActive: (v) {
                          controller.toggleActive(teacher.id);
                        },
                      );
                    },
                  );
                }),
              ),

              const SizedBox(height: 20),
              BottomNewTeacher(
                onPress: () {
                  // final id = DateTime.now().millisecondsSinceEpoch.toString();
                  // final createdAt = DateTime.now().toIso8601String();

                  // form.startCreate(newId: id, createdAt: createdAt);
                  // Get.toNamed('/teacher-form');
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
