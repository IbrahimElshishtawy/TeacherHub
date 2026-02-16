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
    // الحصول على TeacherFormController
    final TeacherFormController controller = Get.find<TeacherFormController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: AlignmentGeometry.centerLeft,
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
        SizedBox(width: 4),
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
