import 'package:flutter/material.dart';

class TestCardWidget extends StatelessWidget {
  final String title;
  final String duration;
  final String date;
  final String totalQuestions;
  final String totalMarks;
  final VoidCallback onStartTest;

  const TestCardWidget({
    super.key,
    required this.title,
    required this.duration,
    required this.date,
    required this.totalQuestions,
    required this.totalMarks,
    required this.onStartTest,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title with bold styling
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Duration and Date
            Text(duration, style: const TextStyle(fontSize: 14)),
            Text(date, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 8),

            // Total Questions and Total Marks
            Text(totalQuestions, style: const TextStyle(fontSize: 14)),
            Text(totalMarks, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 16),

            // Elevated button to start test
            ElevatedButton(
              onPressed: onStartTest,
              child: const Text("ابدأ الاختبار"),
            ),
          ],
        ),
      ),
    );
  }
}
