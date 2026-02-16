import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/widgets/AccountStatusCard.dart';
import 'package:teacher/features/admin/teachers/widgets/action_tile.dart';
import 'package:teacher/features/admin/teachers/widgets/teacher_header.dart';

class CardTeacher extends StatelessWidget {
  final String id;

  final String fullName;
  final String email;
  final String stageLabel;
  final String createdAtLabel;
  final String avatarUrl;
  final bool isActive;

  final VoidCallback onEditData;
  final VoidCallback onPermissions;
  final VoidCallback onAnalytics;

  final ValueChanged<bool> onToggleActive;

  const CardTeacher({
    super.key,
    required this.id,
    required this.fullName,
    required this.email,
    required this.stageLabel,
    required this.createdAtLabel,
    required this.avatarUrl,
    required this.isActive,
    required this.onEditData,
    required this.onPermissions,
    required this.onAnalytics,
    required this.onToggleActive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(206, 255, 255, 255),
      child: Column(
        children: [
          TeacherHeader(
            isActive: isActive,
            fullName: fullName,
            email: email,
            stageLabel: stageLabel,
            createdAtLabel: createdAtLabel,
            avatarUrl: avatarUrl,
          ),
          LayoutBuilder(
            builder: (_, constraints) {
              final crossAxisCount = constraints.maxWidth >= 520 ? 3 : 2;
              return GridView(
                padding: const EdgeInsets.only(bottom: 12),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 1.25,
                ),
                children: [
                  ActionTile(
                    title: 'تعديل البيانات',
                    subtitle: 'تحديث بيانات المدرس الأساسية',
                    onTap: onEditData,
                    iconColor: const Color(0xFFF5A623),
                    child: const Icon(
                      Icons.edit,
                      color: Color(0xFFF5A623),
                      size: 40.0,
                    ),
                  ),
                  ActionTile(
                    title: 'الصلاحيات والأذونات',
                    subtitle: 'إدارة الصلاحيات ووسائل الأمان',
                    onTap: onPermissions,
                    child: const Icon(
                      Icons.verified_user_outlined,
                      color: Color(0xFF2F6FED),
                      size: 40.0,
                    ),
                  ),
                  ActionTile(
                    title: 'تحليل البيانات',
                    subtitle: 'نظرة سريعة على أداء المدرس',
                    onTap: onAnalytics,
                    iconColor: const Color(0xFF2F6FED),
                    child: const Icon(
                      Icons.bar_chart_rounded,
                      color: Color(0xFF2F6FED),
                      size: 40.0,
                    ),
                  ),

                  AccountStatusCard(
                    isActive: isActive,
                    onChanged: onToggleActive,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
