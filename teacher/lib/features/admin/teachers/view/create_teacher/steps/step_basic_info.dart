// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/Create_Teacher_Header.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/step_1/step_basic_info_form_card.dart';
import 'package:teacher/features/auth/view/login/widget.login/AppBar_Tap.dart';

class StepBasicInfo extends StatefulWidget {
  final String selectedOption;
  const StepBasicInfo({super.key, required this.selectedOption});

  @override
  _StepBasicInfoState createState() => _StepBasicInfoState();
}

class _StepBasicInfoState extends State<StepBasicInfo> {
  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePass = true;
  bool obscureConfirm = true;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void onNext() {
    final ok = formKey.currentState?.validate() ?? false;
    if (!ok) return;
    //  Get.to(() => StepAcademicInfo(selectedOption: widget.selectedOption));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: AppbarTap(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Column(
            children: [
              const CreateTeacherHeaderWidget(
                currentStep: 1,
                completedSteps: [false, false, false],
              ),
              const SizedBox(height: 12),

              StepBasicInfoFormCard(
                formKey: formKey,
                fullNameController: fullNameController,
                emailController: emailController,
                phoneController: phoneController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                obscurePass: obscurePass,
                obscureConfirm: obscureConfirm,
                onTogglePass: () => setState(() => obscurePass = !obscurePass),
                onToggleConfirm: () =>
                    setState(() => obscureConfirm = !obscureConfirm),
                onPickImage: () {},
                onNext: onNext,
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
