import 'package:flutter/material.dart';
import 'package:student/Student/Student_home/data/course_card_model.dart';
import 'package:student/Student/Student_home/widgets_home/course/widget/course_card.dart';

import 'courses_section_header.dart';
import 'courses_horizontal_list.dart';

class AvailableCoursesSection extends StatelessWidget {
  /// لو بعت courses من بره هيستخدمها، لو فاضية/مش مبعوتة هيستخدم الديمو
  final List<CourseCardModel>? courses;

  // Callbacks
  final void Function(CourseCardModel course)? onSubscribe;
  final void Function(CourseCardModel course)? onEnter;
  final void Function(CourseCardModel course)? onContinue;
  final VoidCallback? onViewAll;

  const AvailableCoursesSection({
    super.key,
    this.courses,
    this.onSubscribe,
    this.onEnter,
    this.onContinue,
    this.onViewAll,
  });

  List<CourseCardModel> _demoCourses() {
    return const [
      CourseCardModel(
        id: "c1",
        title: "كورس الباب الثاني والثالث",
        imageUrl:
            "https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?w=800",
        scheduleText: "الاثنين، 2 فبراير",
        lessonsText: "2 فيديو",
        priceEGP: 150,
        status: CourseStatus.available,
      ),
      CourseCardModel(
        id: "c2",
        title: "كورس الباب الرابع",
        imageUrl:
            "https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?w=800",
        scheduleText: "الأحد، 4 فبراير",
        lessonsText: "4 فيديو",
        priceEGP: 130,
        status: CourseStatus.available,
      ),
      CourseCardModel(
        id: "c3",
        title: "كورس الباب الأول (مراجعة)",
        imageUrl:
            "https://images.unsplash.com/photo-1521791136064-7986c2920216?w=800",
        scheduleText: "الخميس، 8 فبراير",
        lessonsText: "3 فيديو",
        priceEGP: 120,
        status: CourseStatus.available,
      ),
      CourseCardModel(
        id: "c4",
        title: "كورس تدريبات ومسائل",
        imageUrl:
            "https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?w=800",
        scheduleText: "السبت، 10 فبراير",
        lessonsText: "6 فيديو",
        priceEGP: 200,
        status: CourseStatus.purchased,
      ),
      CourseCardModel(
        id: "c5",
        title: "كورس شامل (ترم كامل)",
        imageUrl:
            "https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?w=800",
        scheduleText: "الاثنين، 12 فبراير",
        lessonsText: "10 فيديو",
        priceEGP: 350,
        status: CourseStatus.available,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final items = (courses == null || courses!.isEmpty)
        ? _demoCourses()
        : courses!;

    return Container(
      margin: const EdgeInsets.fromLTRB(6, 6, 6, 0),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFE9EDF5)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header داخل الكارد
          CoursesSectionHeader(
            title: "كورسـاتنا المتاحة للعام 2025/2026",
            subtitle: "تصفح جميع الكورسات واختر ما يناسبك",
            onViewAll: onViewAll,
          ),

          // List داخل الكارد
          CoursesHorizontalList(
            itemCount: items.length,
            itemBuilder: (_, i) {
              final c = items[i];
              return CourseCard(
                course: c,
                onSubscribe: onSubscribe == null ? null : () => onSubscribe!(c),
                onEnter: onEnter == null ? null : () => onEnter!(c),
                onContinue: onContinue == null ? null : () => onContinue!(c),
              );
            },
          ),
        ],
      ),
    );
  }
}
