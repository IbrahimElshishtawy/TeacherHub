import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/student_register_controller.dart';
import '../widgets/app_text_field.dart';

class Step1BasicInfo extends GetView<StudentRegisterController> {
  const Step1BasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "الاسم بالكامل (الأسم رباعي)",
          textDirection: TextDirection.rtl,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        ),
        const SizedBox(height: 10),
        AppTextField(
          controller: controller.firstName,
          hint: "أدخل أسمك الأول",
          icon: Icons.person,
        ),
        AppTextField(
          controller: controller.fatherName,
          hint: "أدخل أسمك الثاني (الأب)",
          icon: Icons.person_outline,
        ),
        AppTextField(
          controller: controller.grandName,
          hint: "أدخل أسمك الثالث (الجد)",
          icon: Icons.person_outline,
        ),
        AppTextField(
          controller: controller.familyName,
          hint: "أدخل أسمك الرابع (الجد)",
          icon: Icons.person_outline,
        ),
        const SizedBox(height: 10),
        const Text(
          "رقم هاتف الطالب",
          textDirection: TextDirection.rtl,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        ),
        const SizedBox(height: 10),
        AppTextField(
          controller: controller.studentPhone,
          hint: "أدخل رقم الهاتف الخاص بك",
          icon: Icons.phone,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 10),
        const Text(
          "رقم هاتف ولي الأمر",
          textDirection: TextDirection.rtl,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        ),
        const SizedBox(height: 10),
        AppTextField(
          controller: controller.parentPhone,
          hint: "أدخل رقم الهاتف الخاص بولي أمرك",
          icon: Icons.phone_android,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 6),
        Text(
          "يرجى إدخال رقم ولي الأمر الصحيح لتجنب أي مشاكل.",
          textDirection: TextDirection.rtl,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
        ),
      ],
    );
  }
}
