import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/subject_teacher_controller.dart';
import '../state/subject_teacher_state.dart';
import '../widgets/teacher_select_header.dart';
import '../widgets/teacher_card.dart';
import '../widgets/teacher_primary_button.dart';

class TeacherSelectScreen extends GetView<SubjectTeacherController> {
  final SubjectModel subject;
  const TeacherSelectScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    controller.selectedSubjectId.value = subject.id;

    final teachers = controller.teachersForSubject(subject.id);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          "مدرسو ${subject.name}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TeacherSelectHeader(subjectName: subject.name),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                itemCount: teachers.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (_, i) {
                  final t = teachers[i];
                  return Obx(() {
                    final selectedId = controller
                        .selectedTeacher(subject.id)
                        ?.id;
                    final isSelected = selectedId == t.id;

                    return TeacherCard(
                      teacher: t,
                      isSelected: isSelected,
                      onTap: () {
                        controller.setTeacherForSubject(subject.id, t);
                      },
                    );
                  });
                },
              ),
            ),
            Obx(() {
              final showButton = controller.hasSelectedForCurrent;

              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: showButton
                    ? Padding(
                        key: const ValueKey("show_btn"),
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: TeacherPrimaryButton(
                          text: "استكمل باقي المواد",
                          onPressed: () => Get.back(),
                        ),
                      )
                    : const SizedBox(key: ValueKey("hide_btn"), height: 16),
              );
            }),
          ],
        ),
      ),
    );
  }
}
