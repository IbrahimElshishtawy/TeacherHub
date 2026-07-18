import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/Student/quiz/controller/quiz_guard_controller.dart';
import 'package:student/Student/quiz/widgets/quiz_answer_option.dart';
import 'package:student/Student/quiz/widgets/quiz_exam_header.dart';
import 'package:student/Student/quiz/widgets/quiz_navigation_bar.dart';
import 'package:student/Student/quiz/widgets/quiz_progress_strip.dart';
import 'package:student/Student/quiz/widgets/quiz_question_card.dart';

class QuizExamScreen extends GetView<QuizGuardController> {
  const QuizExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) async {
          if (!didPop) {
            await controller.handleExitAttempt();
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFF4F6FB),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF7F9FF), Color(0xFFEEF2FB)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Obx(() {
                if (!controller.state.isExamActive.value) {
                  return const Center(
                    child: Text(
                      'لا توجد جلسة امتحان نشطة.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                }

                final currentQuestion = controller.currentQuestion;
                final currentIndex = controller.state.currentQuestionIndex.value;
                final selected = controller.state.answers[currentIndex];

                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            QuizExamHeader(
                              title: 'اختبار التقييم الدوري',
                              subtitle:
                                  'أجب عن الأسئلة بدقة. الخروج من التطبيق أو محاولة الرجوع ينهي الجلسة مباشرة.',
                              remainingTime: controller.formatRemainingTime(),
                            ),
                            const SizedBox(height: 18),
                            QuizProgressStrip(
                              currentIndex: currentIndex,
                              totalQuestions: controller.state.questions.length,
                            ),
                            const SizedBox(height: 18),
                            QuizQuestionCard(
                              questionNumber: currentIndex + 1,
                              questionText: currentQuestion.question,
                            ),
                            const SizedBox(height: 18),
                            ...List.generate(
                              currentQuestion.options.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: QuizAnswerOption(
                                  text: currentQuestion.options[index],
                                  optionLabel: _optionLabel(index),
                                  isSelected: selected == index,
                                  onTap: () => controller.selectAnswer(index),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF4F6FB),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x12000000),
                            blurRadius: 18,
                            offset: Offset(0, -6),
                          ),
                        ],
                      ),
                      child: QuizNavigationBar(
                        showPrevious: controller.hasPreviousQuestion,
                        hasNextQuestion: controller.hasNextQuestion,
                        onPrevious: controller.goToPreviousQuestion,
                        onNext: controller.goToNextQuestion,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  String _optionLabel(int index) {
    const labels = ['أ', 'ب', 'ج', 'د'];
    return labels[index];
  }
}
