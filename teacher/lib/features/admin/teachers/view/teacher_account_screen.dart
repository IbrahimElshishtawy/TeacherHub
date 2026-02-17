import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/teachers/controller/teacher_account_controller.dart';
import 'package:teacher/features/admin/teachers/controller/teacher_form_controller.dart';
import 'package:teacher/features/admin/teachers/widgets/massage_create_teacher.dart';
import 'package:teacher/features/admin/teachers/widgets/teacher_card.dart';
import 'package:teacher/features/admin/teachers/widgets/bottom_new_teacher.dart';
import 'package:teacher/features/auth/view/login/widget.login/AppBar_Tap.dart';

class TeacherAccountScreen extends GetView<TeachersController> {
  const TeacherAccountScreen({super.key});

  void _safeToNamed(String route, {dynamic arguments}) {
    final match = Get.routeTree.matchRoute(route).route;
    if (match == null) {
      Get.snackbar(
        'خطأ',
        'Route مش متسجل: $route',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
      );
      return;
    }
    Get.toNamed(route, arguments: arguments);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final form = Get.find<TeacherFormController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: AppbarTap(),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 6),
          child: Column(
            children: [
              Column(
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
                        id: teacher.id,
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
                          _safeToNamed('/teachers/teacher-form');
                        },
                        onPermissions: () {
                          form.startEdit(teacher.id);
                          _safeToNamed('/teachers/teacher-permissions');
                        },
                        onAnalytics: () {
                          _safeToNamed(
                            '/teachers/teacher-analytics',
                            arguments: teacher.id,
                          );
                        },

                        onToggleActive: (v) {
                          // لو عندك setActive استخدمها بدل toggleActive
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
