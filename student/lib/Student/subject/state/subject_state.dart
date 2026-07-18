import 'package:flutter/material.dart';

class SubjectItem {
  final String id;
  final String title;
  final String teacherName;
  final IconData icon;
  final Color iconColor;

  const SubjectItem({
    required this.id,
    required this.title,
    required this.teacherName,
    required this.icon,
    required this.iconColor,
  });
}

class SubjectCourseItem {
  final String id;
  final String title;
  final String subtitle;
  final String dateText;
  final String progressLabel;
  final String imageStyle;

  const SubjectCourseItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.dateText,
    required this.progressLabel,
    required this.imageStyle,
  });
}

class SubjectLessonItem {
  final String id;
  final String title;
  final String subtitle;
  final String dateText;
  final String duration;
  final String imageStyle;

  const SubjectLessonItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.dateText,
    required this.duration,
    required this.imageStyle,
  });
}

class SubjectTestRecordItem {
  final String title;
  final String code;
  final int score;
  final int total;

  const SubjectTestRecordItem({
    required this.title,
    required this.code,
    required this.score,
    required this.total,
  });
}

class SubjectOverviewState {
  final String title;
  final String subtitle;
  final List<SubjectItem> subjects;
  final List<SubjectCourseItem> courses;
  final List<SubjectLessonItem> lessons;
  final List<SubjectTestRecordItem> testRecords;

  const SubjectOverviewState({
    required this.title,
    required this.subtitle,
    required this.subjects,
    required this.courses,
    required this.lessons,
    required this.testRecords,
  });

  factory SubjectOverviewState.initial() {
    return const SubjectOverviewState(
      title: 'المواد الدراسية',
      subtitle: 'اختر المادة التي تود البدء بمذاكرتها الآن.',
      subjects: [
        SubjectItem(
          id: 'arabic',
          title: 'اللغة العربية',
          teacherName: 'اسم المدرس',
          icon: Icons.menu_book_rounded,
          iconColor: Color(0xFFF59E0B),
        ),
        SubjectItem(
          id: 'english',
          title: 'اللغة الإنجليزية',
          teacherName: 'اسم المدرس',
          icon: Icons.public_rounded,
          iconColor: Color(0xFF3B82F6),
        ),
        SubjectItem(
          id: 'chemistry',
          title: 'الكيمياء',
          teacherName: 'اسم المدرس',
          icon: Icons.science_outlined,
          iconColor: Color(0xFFEF4444),
        ),
        SubjectItem(
          id: 'french',
          title: 'اللغة الفرنسية',
          teacherName: 'اسم المدرس',
          icon: Icons.language_rounded,
          iconColor: Color(0xFF8B5CF6),
        ),
        SubjectItem(
          id: 'math',
          title: 'الرياضيات',
          teacherName: 'اسم المدرس',
          icon: Icons.functions_rounded,
          iconColor: Color(0xFF10B981),
        ),
        SubjectItem(
          id: 'physics',
          title: 'الفيزياء',
          teacherName: 'اسم المدرس',
          icon: Icons.bolt_rounded,
          iconColor: Color(0xFFF97316),
        ),
        SubjectItem(
          id: 'biology',
          title: 'الأحياء',
          teacherName: 'اسم المدرس',
          icon: Icons.eco_outlined,
          iconColor: Color(0xFF22C55E),
        ),
      ],
      courses: [
        SubjectCourseItem(
          id: 'course_chem_1',
          title: 'كورس الباب الرابع',
          subtitle: 'الروابط الأيونية والتساهمية',
          dateText: 'الثلاثاء 2 فبراير',
          progressLabel: 'تم الشراء',
          imageStyle: 'dna',
        ),
        SubjectCourseItem(
          id: 'course_chem_2',
          title: 'كورس الباب الثاني والثالث',
          subtitle: 'بين مكونات الذرة والإلكترونات والطاقة',
          dateText: 'الثلاثاء 2 فبراير',
          progressLabel: 'تم الشراء',
          imageStyle: 'molecule',
        ),
      ],
      lessons: [
        SubjectLessonItem(
          id: 'lesson_1',
          title: 'مقدمة في الكيمياء',
          subtitle: 'التعرف على المفاهيم الأساسية ومقدمة الباب الأول',
          dateText: 'الثلاثاء 2 فبراير',
          duration: '40:00',
          imageStyle: 'lab',
        ),
        SubjectLessonItem(
          id: 'lesson_2',
          title: 'الذرة وبنيتها',
          subtitle: 'مكونات الذرة والإلكترونات والطاقة',
          dateText: 'الثلاثاء 2 فبراير',
          duration: '40:00',
          imageStyle: 'blue_lab',
        ),
        SubjectLessonItem(
          id: 'lesson_3',
          title: 'الجدول الدوري للعناصر',
          subtitle: 'تصنيف العناصر وفهم المجموعات والدورات',
          dateText: 'الثلاثاء 2 فبراير',
          duration: '40:00',
          imageStyle: 'molecule',
        ),
        SubjectLessonItem(
          id: 'lesson_4',
          title: 'الروابط الكيميائية',
          subtitle: 'الروابط الأيونية والتساهمية وكيفية تكوينها',
          dateText: 'الثلاثاء 2 فبراير',
          duration: '40:00',
          imageStyle: 'glass',
        ),
        SubjectLessonItem(
          id: 'lesson_5',
          title: 'المركبات الكيميائية',
          subtitle: 'التعرف على المركبات وأنواعها',
          dateText: 'الثلاثاء 2 فبراير',
          duration: '40:00',
          imageStyle: 'dna',
        ),
        SubjectLessonItem(
          id: 'lesson_6',
          title: 'التفاعلات الكيميائية',
          subtitle: 'أنواع التفاعلات والقوانين الأساسية',
          dateText: 'الثلاثاء 2 فبراير',
          duration: '40:00',
          imageStyle: 'beaker',
        ),
      ],
      testRecords: [
        SubjectTestRecordItem(
          title: 'اختبار الباب الثاني',
          code: '#54321',
          score: 25,
          total: 30,
        ),
        SubjectTestRecordItem(
          title: 'اختبار الباب الثاني',
          code: '#54321',
          score: 25,
          total: 30,
        ),
        SubjectTestRecordItem(
          title: 'اختبار الباب الثاني',
          code: '#54321',
          score: 25,
          total: 30,
        ),
        SubjectTestRecordItem(
          title: 'اختبار الباب الثاني',
          code: '#54321',
          score: 15,
          total: 30,
        ),
      ],
    );
  }
}
