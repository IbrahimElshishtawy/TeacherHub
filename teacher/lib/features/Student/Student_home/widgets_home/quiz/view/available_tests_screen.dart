import 'package:flutter/material.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/quiz/widget/test_card_widget.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/quiz/widget/test_section_header.dart';

class AvailableTestsScreen extends StatelessWidget {
  const AvailableTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الاختبارات المتاحة")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TestSectionHeader(),
            const SizedBox(height: 20),
            // استخدام Expanded لحل مشكلة القيود غير المحددة
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TestCardWidget(
                      title: 'اختبار على المحاصيل والقواعد',
                      duration: 'مدة الاختبار: 30 دقيقة',
                      date: 'الخميس، 5 فبراير',
                      totalQuestions: '30 سؤال',
                      totalMarks: 'الدرجة الكاملة: 20',
                      onStartTest: () {
                        // بداية الاختبار
                      },
                    ),
                    TestCardWidget(
                      title: 'اختبار على المحاليل والمولارية',
                      duration: 'مدة الاختبار: 30 دقيقة',
                      date: 'السبت، 7 فبراير',
                      totalQuestions: '30 سؤال',
                      totalMarks: 'الدرجة الكاملة: 20',
                      onStartTest: () {
                        // بداية الاختبار
                      },
                    ),
                    // يمكن إضافة المزيد من الاختبارات هنا
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
