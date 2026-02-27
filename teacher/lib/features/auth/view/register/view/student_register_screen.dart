// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/auth/controller/student_register_controller.dart';
import 'package:teacher/features/auth/view/register/steps/step1_basic_info.dart';
import 'package:teacher/features/auth/view/register/steps/step2_email_verify.dart';
import 'package:teacher/features/auth/view/register/steps/step3_stage_teacher.dart';
import 'package:teacher/features/auth/view/register/widgets/primary_button.dart';
import 'package:teacher/features/auth/view/register/widgets/step_header.dart';

class StudentRegisterScreen extends GetView<StudentRegisterController> {
  const StudentRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF1E2D7D);

    final steps = const [
      Step1BasicInfo(),
      Step2EmailVerify(),
      Step3StageTeacher(),
    ];

    final labels = const [
      "المعلومات الأساسية",
      "التحقق من البريد",
      "المرحلة الدراسية",
    ];

    final subtitles = const [
      "أدخل بياناتك الأساسية بدقة.",
      "تحقق من بريدك الإلكتروني باستخدام الكود.",
      "اختر المرحلة والمدرس المسؤول لإكمال التسجيل.",
    ];

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F7FB),

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 22,
              color: Colors.black87,
            ),
            onPressed: controller.back,
          ),

          // ✅ Title + Subtitle ديناميك
          title: Obx(() {
            final idx = controller.stepIndex.value;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "إنشاء حساب الطالب",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitles[idx],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ],
            );
          }),
        ),

        body: Obx(() {
          final idx = controller.stepIndex.value;

          return Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
            child: Column(
              children: [
                // Stepper Header
                StepHeader(currentStep: idx, labels: labels),
                const SizedBox(height: 14),

                // Body Card
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 22,
                            offset: const Offset(0, 10),
                            color: Colors.black.withOpacity(0.06),
                          ),
                        ],
                      ),
                      child: steps[idx],
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Bottom Actions
                SafeArea(
                  top: false,
                  child: Row(
                    children: [
                      if (idx > 0)
                        Expanded(
                          child: SizedBox(
                            height: 52,
                            child: OutlinedButton(
                              onPressed: controller.back,
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color: primary.withOpacity(0.3),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                "السابق",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: primary,
                                ),
                              ),
                            ),
                          ),
                        ),

                      if (idx > 0) const SizedBox(width: 10),

                      // زر Next/Create
                      Expanded(
                        flex: 2,
                        child: Obx(() {
                          final loading =
                              controller.isCreatingAccount.value ||
                              controller.isVerifyingOtp.value;

                          final btnTitle = idx == 2 ? "إنشاء الحساب" : "التالي";

                          return PrimaryButton(
                            title: btnTitle,
                            loading: loading,
                            onTap: controller.next,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
