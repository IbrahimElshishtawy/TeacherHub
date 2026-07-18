// ignore_for_file: avoid_renaming_method_parameters

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/Student/quiz/state/quiz_guard_state.dart';
import 'package:student/Student/quiz/widgets/quiz_security_service.dart';

class QuizGuardController extends GetxController with WidgetsBindingObserver {
  final QuizGuardState state = QuizGuardState();
  Timer? _timer;

  QuizQuestion get currentQuestion =>
      state.questions[state.currentQuestionIndex.value];

  double get progressValue =>
      (state.currentQuestionIndex.value + 1) / state.questions.length;

  bool get hasPreviousQuestion => state.currentQuestionIndex.value > 0;
  bool get hasNextQuestion =>
      state.currentQuestionIndex.value < state.questions.length - 1;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    state.answers.assignAll(List<int?>.filled(state.questions.length, null));
    _loadDeviceInfo();
  }

  @override
  void onClose() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    QuizSecurityService.disableSecureMode();
    super.onClose();
  }

  Future<void> _loadDeviceInfo() async {
    try {
      final QuizDeviceInfo info = await QuizSecurityService.getDeviceInfo();
      state.deviceLabel.value = info.deviceLabel;
      state.isBlockedDevice.value = !info.isPhysicalDevice;
      if (!info.isPhysicalDevice) {
        state.blockReason.value =
            'تم رفض بدء الامتحان لأن الجهاز الحالي Emulator أو غير مدعوم للحماية.';
      }
    } catch (_) {
      state.deviceLabel.value = 'تعذر التحقق من نوع الجهاز';
      state.isBlockedDevice.value = true;
      state.blockReason.value =
          'فشل التحقق من الجهاز. الامتحان الآمن يتطلب جهاز Android فعلي.';
    } finally {
      state.isCheckingDevice.value = false;
    }
  }

  Future<void> startExam() async {
    if (state.isExamActive.value || state.isCheckingDevice.value) {
      return;
    }

    if (state.isBlockedDevice.value) {
      Get.snackbar(
        'بدء الامتحان مرفوض',
        state.blockReason.value,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
      );
      return;
    }

    state.isStarting.value = true;
    await QuizSecurityService.enableSecureMode();
    state.isExamActive.value = true;
    state.remainingSeconds.value = 30 * 60;
    state.currentQuestionIndex.value = 0;
    state.answers.assignAll(List<int?>.filled(state.questions.length, null));
    state.selectedAnswerIndex.value = null;
    _startTimer();
    state.isStarting.value = false;

    Get.toNamed('/quiz-exam');
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final int nextValue = state.remainingSeconds.value - 1;
      if (nextValue <= 0) {
        timer.cancel();
        submitExam(reason: 'انتهى وقت الاختبار وتم تسليم الإجابات الحالية.');
        return;
      }
      state.remainingSeconds.value = nextValue;
    });
  }

  void selectAnswer(int answerIndex) {
    state.selectedAnswerIndex.value = answerIndex;
    state.answers[state.currentQuestionIndex.value] = answerIndex;
    state.answers.refresh();
  }

  void goToNextQuestion() {
    if (!hasNextQuestion) {
      submitExam();
      return;
    }
    state.currentQuestionIndex.value++;
    state.selectedAnswerIndex.value =
        state.answers[state.currentQuestionIndex.value];
  }

  void goToPreviousQuestion() {
    if (!hasPreviousQuestion) {
      return;
    }
    state.currentQuestionIndex.value--;
    state.selectedAnswerIndex.value =
        state.answers[state.currentQuestionIndex.value];
  }

  Future<void> submitExam({String? reason}) async {
    if (!state.isExamActive.value) {
      return;
    }

    _timer?.cancel();
    final String remainingTime = formatRemainingTime();
    state.isExamActive.value = false;
    await QuizSecurityService.disableSecureMode();

    final int answeredCount = state.answers.whereType<int>().length;
    final int score = _calculateScore();
    final double percentage = state.questions.isEmpty
        ? 0
        : (score / state.questions.length) * 100;

    Get.offAllNamed(
      '/quiz-result',
      arguments: <String, dynamic>{
        'remainingTime': remainingTime,
        'score': score,
        'total': state.questions.length,
        'percentage': percentage,
        'note': reason ??
            'تم تسليم $answeredCount/${state.questions.length} أسئلة بنجاح.',
      },
    );
  }

  Future<void> goHomeFromResult() async {
    state.remainingSeconds.value = 1800;
    state.currentQuestionIndex.value = 0;
    state.selectedAnswerIndex.value = null;
    state.answers.assignAll(List<int?>.filled(state.questions.length, null));
    Get.offAllNamed('/home_student');
  }

  int _calculateScore() {
    int score = 0;
    for (int index = 0; index < state.questions.length; index++) {
      if (state.answers[index] == state.questions[index].correctAnswerIndex) {
        score++;
      }
    }
    return score;
  }

  String formatRemainingTime() {
    final int minutes = state.remainingSeconds.value ~/ 60;
    final int seconds = state.remainingSeconds.value % 60;
    return '${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}';
  }

  Future<bool> handleExitAttempt() async {
    if (!state.isExamActive.value) {
      return true;
    }

    Get.snackbar(
      'الخروج غير مسموح',
      'لا يمكن الرجوع أو مغادرة شاشة الاختبار أثناء الجلسة.',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
    return false;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appState) {
    if (!state.isExamActive.value) {
      return;
    }

    if (appState == AppLifecycleState.inactive ||
        appState == AppLifecycleState.paused ||
        appState == AppLifecycleState.hidden) {
      submitExam(
        reason: 'تم إلغاء الاختبار لأن التطبيق خرج من الواجهة أو تم تبديله.',
      );
    }
  }
}
