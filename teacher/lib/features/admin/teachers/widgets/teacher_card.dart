import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/widgets/action_tile.dart';

class CardTeacher extends StatelessWidget {
  final String fullName;
  final String email;
  final String stageLabel;
  final String createdAtLabel;
  final String avatarUrl;
  final bool isActive;
  final VoidCallback onEditData;
  final VoidCallback onPermissions;
  final VoidCallback onAnalytics;

  const CardTeacher({
    super.key,
    required this.fullName,
    required this.email,
    required this.stageLabel,
    required this.createdAtLabel,
    required this.avatarUrl,
    required this.isActive,
    required this.onEditData,
    required this.onPermissions,
    required this.onAnalytics,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(206, 255, 255, 255),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
              radius: 30,
            ),
            title: Text(
              fullName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(email),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stage: $stageLabel'),
                Text('Created At: $createdAtLabel'),
                Text('Account Status: ${isActive ? 'Active' : 'Inactive'}'),
              ],
            ),
          ),
          // Add Action Tiles
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
                    child: Icon(
                      Icons.edit,
                      color: const Color(0xFFF5A623),
                      size: 40.0,
                    ),
                  ),
                  ActionTile(
                    title: 'الصلاحيات والأذونات',
                    subtitle: 'إدارة الصلاحيات ووسائل الأمان',
                    onTap: onPermissions,
                    child: Icon(
                      Icons.verified_user_outlined,
                      color: const Color(0xFF2F6FED),
                      size: 40.0,
                    ),
                  ),
                  ActionTile(
                    title: 'تحليل البيانات',
                    subtitle: 'نظرة سريعة على أداء المدرس',
                    onTap: onAnalytics,
                    iconColor: const Color(0xFF2F6FED),
                    child: Icon(
                      Icons.bar_chart_rounded,
                      color: const Color(0xFF2F6FED),
                      size: 40.0,
                    ),
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
