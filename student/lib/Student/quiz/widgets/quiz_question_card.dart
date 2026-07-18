import 'package:flutter/material.dart';

class QuizQuestionCard extends StatelessWidget {
  final int questionNumber;
  final String questionText;

  const QuizQuestionCard({
    super.key,
    required this.questionNumber,
    required this.questionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 22, 18, 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF0FF),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              'السؤال $questionNumber',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color(0xFF2340A2),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            questionText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              height: 1.7,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1F2430),
            ),
          ),
        ],
      ),
    );
  }
}
