import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/teacher_account_controller.dart';
import '../widgets/action_tile.dart';
import '../widgets/teacher_header.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Column(
            children: [
              Obx(() {
                final s = controller.state.value;
                return TeacherHeader(
                  isActive: s.isActive,
                  fullName: s.fullName,
                  email: s.email,
                  stageLabel: s.stageLabel,
                  createdAtLabel: s.createdAtLabel,
                  avatarUrl: s.avatarUrl,
                );
              }),
              const SizedBox(height: 14),

              Expanded(
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    // Responsive: لو الشاشة أعرض، نخليها 3 أعمدة
                    final crossAxisCount = constraints.maxWidth >= 520 ? 3 : 2;

                    return GridView(
                      padding: const EdgeInsets.only(bottom: 12),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.25,
                      ),
                      children: [
                        ActionTile(
                          icon: Icons.edit,
                          title: 'تعديل البيانات',
                          subtitle: 'تحديث بيانات المدرس الأساسية',
                          onTap: controller.onEditData,
                          iconColor: const Color(0xFFF5A623),
                        ),
                        ActionTile(
                          icon: Icons.verified_user_outlined,
                          title: 'الصلاحيات والأذونات',
                          subtitle: 'إدارة الصلاحيات ووسائل الأمان',
                          onTap: controller.onPermissions,
                        ),
                        Obx(() {
                          final isActive = controller.state.value.isActive;
                          return ActionTile(
                            icon: Icons.toggle_on,
                            title: 'حالة الحساب',
                            subtitle: isActive
                                ? 'إمكانية العمل/التفعيل'
                                : 'الحساب متوقف حالياً',
                            onTap: controller.toggleActive,
                            backgroundColor: const Color(0xFFE9F9EF),
                            borderColor: const Color(0xFFBDECCB),
                            iconColor: const Color(0xFF2ECC71),
                          );
                        }),
                        ActionTile(
                          icon: Icons.bar_chart_rounded,
                          title: 'تحليل البيانات',
                          subtitle: 'نظرة سريعة على أداء المدرس',
                          onTap: controller.onAnalytics,
                          iconColor: const Color(0xFF2F6FED),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // زر إنشاء حساب مدرس جديد
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: controller.onCreateTeacher,
                  icon: const Icon(Icons.add),
                  label: const Text(
                    'إنشاء حساب مدرس جديد',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2F6FED),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
