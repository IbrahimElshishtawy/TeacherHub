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

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F7FB),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
            onPressed: controller.back,
          ),
          title: const Text(
            "إنشاء حساب الطالب",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          final idx = controller.stepIndex.value;

          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 16),
            child: Column(
              children: [
                StepHeader(currentStep: idx, labels: labels),
                const SizedBox(height: 18),

                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                            color: Colors.black.withOpacity(0.06),
                          ),
                        ],
                      ),
                      child: steps[idx],
                    ),
                  ),
                ),

                const SizedBox(height: 14),
                Obx(() {
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
              ],
            ),
          );
        }),
      ),
    );
  }
}
