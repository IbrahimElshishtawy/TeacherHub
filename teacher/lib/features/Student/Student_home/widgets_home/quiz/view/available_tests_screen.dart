import 'package:flutter/material.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/quiz/widget/test_card_widget.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/quiz/widget/test_section_header.dart';

class AvailableTestsScreen extends StatelessWidget {
  const AvailableTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> testData = [
      {
        'title': 'اختبار على المحاصيل والقواعد',
        'duration': 'مدة الاختبار: 30 دقيقة',
        'date': 'الخميس، 5 فبراير',
        'totalQuestions': '30 سؤال',
        'totalMarks': 'الدرجة الكاملة: 20',
        'isAvailable': 'true', // إضافة متغير الحالة
      },
      {
        'title': 'اختبار على المحاليل والمولارية',
        'duration': 'مدة الاختبار: 30 دقيقة',
        'date': 'السبت، 7 فبراير',
        'totalQuestions': '30 سؤال',
        'totalMarks': 'الدرجة الكاملة: 20',
        'isAvailable': 'false', // إضافة متغير الحالة
      },
      {
        'title': 'اختبار على الكيمياء العضوية',
        'duration': 'مدة الاختبار: 45 دقيقة',
        'date': 'الاثنين، 9 فبراير',
        'totalQuestions': '40 سؤال',
        'totalMarks': 'الدرجة الكاملة: 30',
        'isAvailable': 'true', // إضافة متغير الحالة
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity, // إتاحة عرض كامل للمحتويات
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16), // حدود مستديرة للكادر
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                const TestSectionHeader(), // عنوان أو رأس القسم
                const SizedBox(height: 10),
                // حاوية اختبارات
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    // التمرير الأفقي للاختبارات
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: testData.map((test) {
                        // تحويل القيمة إلى bool من خلال isAvailable
                        bool isTestAvailable = test['isAvailable'] == 'true';

                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: TestCardWidget(
                            title: test['title']!,
                            duration: test['duration']!,
                            date: test['date']!,
                            totalQuestions: test['totalQuestions']!,
                            totalMarks: test['totalMarks']!,
                            isTestAvailable: isTestAvailable, // تمرير الحالة
                            onStartTest: () {
                              // إضافة العملية الخاصة بك عند بدء الاختبار
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
