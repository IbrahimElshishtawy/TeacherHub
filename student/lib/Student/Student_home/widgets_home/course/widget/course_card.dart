import 'package:flutter/material.dart';
import 'package:student/Student/Student_home/data/course_card_model.dart';

import 'course_card_image.dart';
import 'course_card_title.dart';
import 'course_card_meta_row.dart';
import 'course_card_price.dart';
import 'course_card_actions.dart';

class CourseCard extends StatelessWidget {
  final CourseCardModel course;

  final VoidCallback? onSubscribe;
  final VoidCallback? onEnter;
  final VoidCallback? onContinue;

  const CourseCard({
    super.key,
    required this.course,
    this.onSubscribe,
    this.onEnter,
    this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 300,
        height: 320,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE9EDF5)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CourseCardImage(imageUrl: course.imageUrl),
            const SizedBox(height: 10),

            CourseCardTitle(title: course.title),
            const SizedBox(height: 6),

            CourseCardMetaRow(
              scheduleText: course.scheduleText,
              lessonsText: course.lessonsText,
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                CourseCardPrice(
                  priceEGP: course.priceEGP,
                  status: course.status,
                ),
                //const Spacer(),
              ],
            ),
            const SizedBox(height: 10),

            CourseCardActions(
              status: course.status,
              onSubscribe: onSubscribe,
              onEnter: onEnter,
              onContinue: onContinue,
            ),
          ],
        ),
      ),
    );
  }
}
