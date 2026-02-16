import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/step_permissions.dart';

class TeacherPermissionsScreen extends StatelessWidget {
  const TeacherPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final selectedOption = (args is Map && args['selectedOption'] is String)
        ? args['selectedOption'] as String
        : '';

    return StepPermissions(selectedOption: selectedOption);
  }
}
