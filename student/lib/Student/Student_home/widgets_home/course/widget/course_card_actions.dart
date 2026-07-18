import 'package:flutter/material.dart';
import 'package:teacher/features/Student/Student_home/data/course_card_model.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/course/widget/course_primary_button.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/course/widget/course_secondary_button.dart';

class CourseCardActions extends StatelessWidget {
  final CourseStatus status;
  final VoidCallback? onSubscribe;
  final VoidCallback? onEnter;
  final VoidCallback? onContinue;

  const CourseCardActions({
    super.key,
    required this.status,
    this.onSubscribe,
    this.onEnter,
    this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    if (status == CourseStatus.purchased) {
      return SizedBox(
        width: double.infinity,
        child: CoursePrimaryButton(
          text: "متابعة التقدم في الكورس",
          onPressed: onContinue,
          height: 38,
          radius: 9,
        ),
      );
    }

    if (status == CourseStatus.locked) {
      return SizedBox(
        width: double.infinity,
        child: CourseSecondaryButton(
          text: "مقفل",
          onPressed: null,
          height: 38,
          radius: 9,
        ),
      );
    }

    // available
    return Row(
      children: [
        Expanded(
          child: CourseSecondaryButton(
            text: "الدخول للكورس",
            onPressed: onEnter,
            height: 38,
            radius: 9,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CoursePrimaryButton(
            text: "الاشتراك",
            onPressed: onSubscribe,
            height: 38,
            radius: 9,
          ),
        ),
      ],
    );
  }
}
