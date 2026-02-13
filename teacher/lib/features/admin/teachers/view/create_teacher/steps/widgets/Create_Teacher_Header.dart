import 'package:flutter/material.dart';

class CreateTeacherHeaderWidget extends StatelessWidget {
  const CreateTeacherHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Text
        const Text(
          'إنشاء حساب جديد للمدرس',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),

        // Instruction Text
        const Text(
          'إدخال بيانات المدرس وتحديد الصلاحيات قبل إنشاء الحساب',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7C93),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),

        // Step Indicator
        StepIndicatorWidget(),
      ],
    );
  }
}

class StepIndicatorWidget extends StatelessWidget {
  const StepIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Step 1 - Basic Information
        StepIndicator(
          stepNumber: 1,
          stepTitle: 'البيانات الأساسية',
          isActive: true,
        ),
        const SizedBox(width: 15),

        // Step 2 - Educational Information
        StepIndicator(
          stepNumber: 2,
          stepTitle: 'البيانات التعليمية',
          isActive: false,
        ),
        const SizedBox(width: 15),

        // Step 3 - Permissions
        StepIndicator(stepNumber: 3, stepTitle: 'الصلاحيات', isActive: false),
      ],
    );
  }
}

class StepIndicator extends StatelessWidget {
  final int stepNumber;
  final String stepTitle;
  final bool isActive;

  const StepIndicator({
    required this.stepNumber,
    required this.stepTitle,
    required this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Circle to represent the step
        CircleAvatar(
          radius: 20,
          backgroundColor: isActive
              ? const Color(0xFF2F6FED)
              : const Color(0xFFBDBDBD),
          child: Text(
            '$stepNumber',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 5),
        // Title of the step
        Text(
          stepTitle,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? const Color(0xFF2F6FED) : const Color(0xFFBDBDBD),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
