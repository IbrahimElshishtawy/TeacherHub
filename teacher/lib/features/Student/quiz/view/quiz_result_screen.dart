import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/Student/quiz/controller/quiz_guard_controller.dart';
import 'package:teacher/features/Student/quiz/widgets/quiz_result_gauge.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data =
        (Get.arguments as Map<String, dynamic>?) ?? <String, dynamic>{};
    final String remainingTime = (data['remainingTime'] as String?) ?? '00 : 00';
    final int score = (data['score'] as int?) ?? 0;
    final int total = (data['total'] as int?) ?? 0;
    final double percentage = (data['percentage'] as double?) ?? 0;
    final String? note = data['note'] as String?;
    final QuizGuardController controller = Get.find<QuizGuardController>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: const Color(0xFFF1F2F6),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'اختبار التقييم الدوري',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1C1D22),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'أجب عن الأسئلة بدقة، وبالتوفيق في كل تفصيلة.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF202A8C),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      remainingTime,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.fromLTRB(12, 16, 12, 18),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(color: const Color(0xFFD1D1D1)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x12000000),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'نتيجة الاختبار',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF23242B),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF4F5F9),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: const Color(0xFFD6D8E0)),
                          ),
                          child: Column(
                            children: [
                              QuizResultGauge(percentage: percentage),
                              const SizedBox(height: 12),
                              Text(
                                '$score / $total',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF3B3E49),
                                ),
                              ),
                              if (note != null && note.isNotEmpty) ...[
                                const SizedBox(height: 10),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    note,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFF6B7080),
                                      fontSize: 13,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        TextButton(
                          onPressed: controller.goHomeFromResult,
                          child: const Text(
                            'رجوع للرئيسية',
                            style: TextStyle(
                              color: Color(0xFF4285F4),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
