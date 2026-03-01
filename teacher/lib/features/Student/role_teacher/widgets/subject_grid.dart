import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/subject_teacher_controller.dart';
import '../widgets/subject_tile.dart';
import '../view/teacher_select_screen.dart';

class SubjectGrid extends GetView<SubjectTeacherController> {
  const SubjectGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // ✅ observable inside
      final selectedMap = controller.state.selectedTeachers;

      return GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 16),
        itemCount: controller.subjects.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.45,
        ),
        itemBuilder: (_, i) {
          final s = controller.subjects[i];
          final teacher = selectedMap[s.id];

          return SubjectTile(
            subjectName: s.name,
            icon: Icons.school,
            selectedTeacherName: teacher?.name,
            selectedTeacherAvatar: teacher?.avatarUrl,
            onTap: () {
              Get.to(
                () => TeacherSelectScreen(subject: s),
                transition: Transition.cupertino,
              );
            },
          );
        },
      );
    });
  }
}
