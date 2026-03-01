import 'package:flutter/material.dart';
import 'package:teacher/features/Student/Student_home/data/course_card_model.dart';

class CourseCardPrice extends StatelessWidget {
  final int priceEGP;
  final CourseStatus status;

  const CourseCardPrice({
    super.key,
    required this.priceEGP,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    if (status == CourseStatus.purchased) {
      return const Text(
        "تم الشراء",
        style: TextStyle(
          color: Color(0xFF2F80ED),
          fontWeight: FontWeight.w900,
          fontSize: 12.5,
        ),
      );
    }

    if (status == CourseStatus.locked) {
      return Text(
        "غير متاح",
        style: TextStyle(
          color: Colors.black.withOpacity(.45),
          fontWeight: FontWeight.w900,
          fontSize: 12.5,
        ),
      );
    }

    return Text(
      "$priceEGP جنيه",
      style: const TextStyle(
        color: Color(0xFF27AE60),
        fontWeight: FontWeight.w900,
        fontSize: 12.5,
      ),
    );
  }
}
