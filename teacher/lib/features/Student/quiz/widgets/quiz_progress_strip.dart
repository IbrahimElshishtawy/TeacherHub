import 'package:flutter/material.dart';

class QuizProgressStrip extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;

  const QuizProgressStrip({
    super.key,
    required this.currentIndex,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: LinearProgressIndicator(
                  value: (currentIndex + 1) / totalQuestions,
                  minHeight: 10,
                  backgroundColor: const Color(0xFFDADFF0),
                  valueColor: const AlwaysStoppedAnimation(Color(0xFF4A7FFF)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFE3E7F1)),
              ),
              child: Text(
                '${currentIndex + 1}/$totalQuestions',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1D2A73),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 10,
          child: Row(
            children: List.generate(
              totalQuestions,
              (index) => Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: index <= currentIndex
                        ? const Color(0xFF4A7FFF)
                        : const Color(0xFFD7DCE8),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
