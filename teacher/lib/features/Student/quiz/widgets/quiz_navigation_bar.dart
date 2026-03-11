import 'package:flutter/material.dart';

class QuizNavigationBar extends StatelessWidget {
  final bool showPrevious;
  final bool hasNextQuestion;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const QuizNavigationBar({
    super.key,
    required this.showPrevious,
    required this.hasNextQuestion,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showPrevious)
          Expanded(
            child: OutlinedButton(
              onPressed: onPrevious,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF2340A2),
                side: const BorderSide(color: Color(0xFFC8D3F5)),
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              child: const Text('السابق'),
            ),
          ),
        if (showPrevious) const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color(0xFF4A7FFF),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
              ),
            ),
            child: Text(hasNextQuestion ? 'السؤال التالي' : 'تسليم الاختبار'),
          ),
        ),
      ],
    );
  }
}
