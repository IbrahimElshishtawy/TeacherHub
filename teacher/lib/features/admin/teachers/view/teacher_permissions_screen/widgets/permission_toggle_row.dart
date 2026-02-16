import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/teachers/controller/teacher_form_controller.dart';

class PermissionToggleRow extends StatelessWidget {
  final String title;
  final String permissionKey;

  const PermissionToggleRow({
    super.key,
    required this.title,
    required this.permissionKey,
  });

  @override
  Widget build(BuildContext context) {
    final TeacherFormController controller = Get.find<TeacherFormController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B7C93),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Obx(() {
          final teacher = controller.teacher.value;
          final isPermissionEnabled =
              teacher?.permissions[permissionKey] ?? false;

          return Switch(
            value: isPermissionEnabled,
            onChanged: (bool value) {
              controller.patch(
                permissions: {...?teacher?.permissions, permissionKey: value},
              );
            },
            activeThumbColor: Colors.green,
            inactiveThumbColor: Colors.red,
          );
        }),
      ],
    );
  }
}

class SectionWithPermissions extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const SectionWithPermissions({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ],
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1E2A3B),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Icon(icon, color: const Color(0xFF1E2A3B), size: 24),
      ],
    );
  }
}
