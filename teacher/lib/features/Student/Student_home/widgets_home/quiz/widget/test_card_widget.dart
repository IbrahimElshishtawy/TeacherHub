import 'package:flutter/material.dart';

class TestCardWidget extends StatelessWidget {
  final String title;
  final String duration;
  final String date;
  final String totalQuestions;
  final String totalMarks;
  final VoidCallback onStartTest;
  final bool isTestAvailable;

  const TestCardWidget({
    super.key,
    required this.title,
    required this.duration,
    required this.date,
    required this.totalQuestions,
    required this.totalMarks,
    required this.onStartTest,
    required this.isTestAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 6,
      ), // تقريب المسافات
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      shadowColor: Colors.black.withOpacity(0.2),
      child: Container(
        padding: const EdgeInsets.all(10), // تقليل padding لجعل العناصر قريبة
        width: 220,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white, // الكارد باللون الأبيض
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white, // النص باللون الأبيض
              ),
            ),
            const SizedBox(height: 8),
            Text(
              duration,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(179, 0, 0, 0),
              ),
            ),
            Text(
              date,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(179, 2, 2, 2),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              totalQuestions,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(179, 0, 0, 0),
              ),
            ),
            Text(
              totalMarks,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(179, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isTestAvailable ? onStartTest : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: isTestAvailable ? Colors.blue : Colors.grey,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text(
                isTestAvailable ? "ابدأ الاختبار" : "الاختبار غير متاح بعد",
                style: TextStyle(
                  color: isTestAvailable ? Colors.white : Colors.grey[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
