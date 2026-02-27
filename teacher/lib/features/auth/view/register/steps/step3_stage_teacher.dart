import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/student_register_controller.dart';

class Step3StageTeacher extends GetView<StudentRegisterController> {
  const Step3StageTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    InputDecoration decoration(String hint, IconData icon) => InputDecoration(
      hintText: hint,
      hintTextDirection: TextDirection.rtl,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF1E2D7D), width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "المرحلة التعليمية",
          textDirection: TextDirection.rtl,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        ),
        const SizedBox(height: 10),
        Obx(() {
          return DropdownButtonFormField<int>(
            initialValue: controller.selectedStageId.value,
            items: controller.stages
                .map(
                  (e) => DropdownMenuItem<int>(
                    value: e["id"] as int,
                    child: Text(e["name"], textDirection: TextDirection.rtl),
                  ),
                )
                .toList(),
            onChanged: (v) async {
              controller.selectedStageId.value = v;
              controller.selectedTeacherId.value = null;
              if (v != null) await controller.loadTeachersByStage(v);
            },
            decoration: decoration(
              "اختر السنة الدراسية",
              Icons.school_outlined,
            ),
          );
        }),
        const SizedBox(height: 16),
        const Text(
          "المدرس المسؤول",
          textDirection: TextDirection.rtl,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        ),
        const SizedBox(height: 10),
        Obx(() {
          return DropdownButtonFormField<int>(
            initialValue: controller.selectedTeacherId.value,
            items: controller.teachers
                .map(
                  (e) => DropdownMenuItem<int>(
                    value: e["id"] as int,
                    child: Text(e["name"], textDirection: TextDirection.rtl),
                  ),
                )
                .toList(),
            onChanged: (v) => controller.selectedTeacherId.value = v,
            decoration: decoration(
              "اختر المدرس المسؤول",
              Icons.person_pin_circle_outlined,
            ),
          );
        }),
        const SizedBox(height: 10),
        Text(
          "اختر المدرس المسؤول لتفعيل التقارير والإشعارات.",
          textDirection: TextDirection.rtl,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
        ),
      ],
    );
  }
}
