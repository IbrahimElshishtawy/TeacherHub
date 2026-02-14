// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/widget%20view/StepIndicator.dart';

class CreateTeacherHeaderWidget extends StatelessWidget {
  /// currentStep: من 1 إلى 3
  final int currentStep;

  /// لو عايز تتحكم يدويًا في الاكتمال:
  /// مثال: [true, false, false]
  /// لو مش هتبعتها، هنحسبها تلقائيًا بناءً على currentStep
  final List<bool>? completedSteps;

  const CreateTeacherHeaderWidget({
    super.key,
    required this.currentStep,
    this.completedSteps,
  });

  @override
  Widget build(BuildContext context) {
    final done = completedSteps ?? _autoCompleted(currentStep);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'إنشاء حساب جديد للمدرس',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            'إدخال بيانات المدرس وتحديد الصلاحيات قبل إنشاء الحساب',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF6B7C93),
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),

        // ✅ خطوات 1..3
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StepIndicator(
              stepNumber: 1,
              stepTitle: 'البيانات الأساسية',
              isActive: currentStep == 1,
              isCompleted: done[0],
            ),
            const SizedBox(width: 14),
            StepIndicator(
              stepNumber: 2,
              stepTitle: 'البيانات التعليمية',
              isActive: currentStep == 2,
              isCompleted: done[1],
            ),
            const SizedBox(width: 14),
            StepIndicator(
              stepNumber: 3,
              stepTitle: 'الصلاحيات',
              isActive: currentStep == 3,
              isCompleted: done[2],
            ),
          ],
        ),
      ],
    );
  }

  List<bool> _autoCompleted(int step) {
    // لو currentStep = 1 => ولا خطوة مكتملة
    // لو currentStep = 2 => الخطوة 1 مكتملة
    // لو currentStep = 3 => الخطوة 1 و 2 مكتملين
    return [step > 1, step > 2, false];
  }
}
