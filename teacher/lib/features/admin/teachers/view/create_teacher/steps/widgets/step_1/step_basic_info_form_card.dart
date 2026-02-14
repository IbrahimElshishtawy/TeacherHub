import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/step_1/step_basic_info_fields.dart';

class StepBasicInfoFormCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  final bool obscurePass;
  final bool obscureConfirm;

  final VoidCallback onTogglePass;
  final VoidCallback onToggleConfirm;

  final VoidCallback onPickImage;
  final VoidCallback onNext;

  const StepBasicInfoFormCard({
    super.key,
    required this.formKey,
    required this.fullNameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.obscurePass,
    required this.obscureConfirm,
    required this.onTogglePass,
    required this.onToggleConfirm,
    required this.onPickImage,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFFE6ECF5);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: StepBasicInfoFields(
          fullNameController: fullNameController,
          emailController: emailController,
          phoneController: phoneController,
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController,
          obscurePass: obscurePass,
          obscureConfirm: obscureConfirm,
          onTogglePass: onTogglePass,
          onToggleConfirm: onToggleConfirm,
          onPickImage: onPickImage,
          onNext: onNext,
        ),
      ),
    );
  }
}
