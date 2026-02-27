// ignore_for_file: duplicate_ignore, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/student_register_controller.dart';

class Step3StageTeacher extends GetView<StudentRegisterController> {
  const Step3StageTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF1E2D7D);

    InputDecoration decoration({
      required String hint,
      required IconData icon,
    }) => InputDecoration(
      hintText: hint,
      hintTextDirection: TextDirection.rtl,
      prefixIcon: Icon(icon, color: primary),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primary, width: 1.8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    );

    Widget fieldTitle(String text) => Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        textDirection: TextDirection.rtl,
        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "المرحلة والمدرس",
          textDirection: TextDirection.rtl,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
        ),
        const SizedBox(height: 6),
        Align(
          alignment: AlignmentGeometry.centerRight,
          child: Text(
            "اختار المرحلة الدراسية وبعدها المدرس المسؤول.",
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
        ),
        const SizedBox(height: 14),

        // Card
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                blurRadius: 18,
                offset: const Offset(0, 10),
                color: Colors.black.withOpacity(0.06),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: primary.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.school, color: primary),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "بيانات الدراسة",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Stage
              fieldTitle("المرحلة التعليمية"),
              Obx(() {
                final value = controller.selectedStageId.value;

                return DropdownButtonFormField<int>(
                  initialValue: value,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  items: controller.stages
                      .map(
                        (e) => DropdownMenuItem<int>(
                          value: e["id"] as int,
                          child: Text(
                            e["name"],
                            textDirection: TextDirection.rtl,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (v) async {
                    controller.selectedStageId.value = v;
                    controller.selectedTeacherId.value = null;

                    if (v != null) {
                      // لو عندك لودينج في الكنترول شغله هنا
                      controller.isLoadingTeachers.value = true;
                      await controller.loadTeachersByStage(v);
                      controller.isLoadingTeachers.value = false;
                    }
                  },
                  decoration: decoration(
                    hint: "اختر السنة الدراسية",
                    icon: Icons.school_outlined,
                  ),
                );
              }),

              const SizedBox(height: 16),

              // Teacher
              fieldTitle("المدرس المسؤول"),
              Obx(() {
                final stageSelected = controller.selectedStageId.value != null;
                final teacherValue = controller.selectedTeacherId.value;
                final loadingTeachers = (controller.isLoadingTeachers.value);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<int>(
                      initialValue: teacherValue,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      items: controller.teachers
                          .map(
                            (e) => DropdownMenuItem<int>(
                              value: e["id"] as int,
                              child: Text(
                                e["name"],
                                textDirection: TextDirection.rtl,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: stageSelected && !loadingTeachers
                          ? (v) => controller.selectedTeacherId.value = v
                          : null,
                      decoration: decoration(
                        hint: stageSelected
                            ? (loadingTeachers
                                  ? "جاري تحميل المدرسين..."
                                  : "اختر المدرس المسؤول")
                            : "اختر المرحلة أولاً",
                        icon: Icons.person_pin_circle_outlined,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Hint
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 16,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            "اختيار المدرس المسؤول يساعد في تفعيل التقارير والإشعارات.",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
