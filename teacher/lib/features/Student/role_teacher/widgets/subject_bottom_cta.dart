// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/subject_teacher_controller.dart';
import 'teacher_primary_button.dart';

class SubjectBottomCta extends GetView<SubjectTeacherController> {
  const SubjectBottomCta({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Obx(() {
      final enabled = controller.state.selectedTeachers.isNotEmpty;
      final selectedCount = controller.state.selectedTeachers.length;

      return Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 12 + bottomInset),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE9EDF5)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 14,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    enabled ? Icons.check_circle : Icons.info_outline,
                    size: 18,
                    color: enabled ? const Color(0xFF27AE60) : Colors.black45,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      enabled
                          ? "تم اختيار $selectedCount مادة — جاهز للدخول"
                          : "لازم تختار مادة ومدرس علشان تكمل",
                      style: TextStyle(
                        color: enabled
                            ? const Color(0xFF27AE60)
                            : Colors.black54,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              TeacherPrimaryButton(
                text: enabled ? "الدخول للتطبيق" : "اختر مادة ومدرس أولاً",

                icon: Icons.login_rounded,
                onPressed: enabled
                    ? () {
                        Get.offAllNamed(
                          '/home_student',
                          arguments: controller.state.selectedTeachers.values
                              .toList(),
                        );
                      }
                    : null,
              ),
            ],
          ),
        ),
      );
    });
  }
}
