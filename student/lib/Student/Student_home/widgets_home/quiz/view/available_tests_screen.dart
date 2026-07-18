// ignore_for_file: unnecessary_underscores, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/Student/Student_home/widgets_home/quiz/widget/test_card_widget.dart';
import 'package:student/Student/Student_home/widgets_home/quiz/widget/test_section_header.dart';

class AvailableTestsScreen extends StatelessWidget {
  const AvailableTestsScreen({super.key});

  static const double _cardGap = 8;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> testData = [
      {
        'title': 'اختبار على المحاصيل والقواعد',
        'duration': 'مدة الاختبار: 30 دقيقة',
        'date': 'الخميس، 5 فبراير',
        'totalQuestions': '30 سؤال',
        'totalMarks': 'الدرجة الكاملة: 20',
        'isAvailable': true,
      },
      {
        'title': 'اختبار على المحاليل والمولارية',
        'duration': 'مدة الاختبار: 30 دقيقة',
        'date': 'السبت، 7 فبراير',
        'totalQuestions': '30 سؤال',
        'totalMarks': 'الدرجة الكاملة: 20',
        'isAvailable': false,
      },
      {
        'title': 'اختبار على الكيمياء العضوية',
        'duration': 'مدة الاختبار: 45 دقيقة',
        'date': 'الاثنين، 9 فبراير',
        'totalQuestions': '40 سؤال',
        'totalMarks': 'الدرجة الكاملة: 30',
        'isAvailable': true,
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE9EDF5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TestSectionHeader(),
          const SizedBox(height: 12),
          SizedBox(
            height: 230,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: testData.length,
              separatorBuilder: (_, __) => const SizedBox(width: _cardGap),
              itemBuilder: (context, index) {
                final item = testData[index];
                return TestCardWidget(
                  title: item['title'],
                  duration: item['duration'],
                  date: item['date'],
                  totalQuestions: item['totalQuestions'],
                  totalMarks: item['totalMarks'],
                  isTestAvailable: item['isAvailable'],
                  onStartTest: () => Get.toNamed('/quiz-entry'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
