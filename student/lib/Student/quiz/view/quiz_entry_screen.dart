import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/Student/quiz/controller/quiz_guard_controller.dart';

class QuizEntryScreen extends GetView<QuizGuardController> {
  const QuizEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) async {
          if (didPop) {
            return;
          }
          await controller.handleExitAttempt();
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFF3F4F6),
          appBar: AppBar(
            backgroundColor: const Color(0xFFF3F4F6),
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFB3261E)),
              onPressed: () async {
                final canExit = await controller.handleExitAttempt();
                if (canExit && context.mounted) {
                  Get.back();
                }
              },
            ),
            centerTitle: true,
            title: const Text(
              'كود دخول الامتحان',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          body: SafeArea(
            child: Obx(
              () => SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'أدخل الكود المستلم من المعلم للوصول إلى محتوى الاختبار',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF7A7A7A),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 28),
                    Obx(
                      () => Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: controller.state.isBlockedDevice.value
                              ? const Color(0xFFFDECEC)
                              : const Color(0xFFEAF6EA),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: controller.state.isBlockedDevice.value
                                ? const Color(0xFFE6B4B4)
                                : const Color(0xFFB8E0B8),
                          ),
                        ),
                        child: controller.state.isCheckingDevice.value
                            ? const Text(
                                'جاري فحص نوع الجهاز قبل بدء الامتحان...',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )
                            : Column(
                                children: [
                                  Text(
                                    'نوع الجهاز: ${controller.state.deviceLabel.value}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF1E1E1E),
                                    ),
                                  ),
                                  if (controller.state.isBlockedDevice.value) ...[
                                    const SizedBox(height: 6),
                                    Text(
                                      controller.state.blockReason.value,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xFFB3261E),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    TextField(
                      enabled: !controller.state.isExamActive.value &&
                          !controller.state.isBlockedDevice.value,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'أدخل كود الاختبار',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFD8D8D8)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFD8D8D8)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFF4F86F7)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Center(
                      child: ElevatedButton(
                        onPressed: controller.state.isStarting.value ||
                                controller.state.isCheckingDevice.value
                            ? null
                            : controller.startExam,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4F86F7),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: controller.state.isStarting.value
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                controller.state.isCheckingDevice.value
                                    ? 'جار التحقق من الجهاز'
                                    : controller.state.isExamActive.value
                                    ? 'الاختبار قيد التشغيل'
                                    : 'ابدأ الاختبار',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 34),
                    const Text(
                      'تعليمات وقوانين الاختبار',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF222222),
                      ),
                    ),
                    const SizedBox(height: 18),
                    const _RuleItem(
                      title: 'الالتزام بالتطبيق:',
                      body:
                          'مغادرة التطبيق أو فتح نافذة الاختبار لأي سبب قد يؤدي إلى إغلاق الاختبار تلقائيًا.',
                    ),
                    const _RuleItem(
                      title: 'خصوصية المحتوى:',
                      body:
                          'يُمنع التقاط الشاشة أو تصوير المحتوى أثناء الجلسة، وسيتم حجب ذلك على أجهزة Android المدعومة.',
                    ),
                    const _RuleItem(
                      title: 'إدارة الوقت:',
                      body:
                          'التزم بالوقت الموضح أعلى الشاشة. عند انتهاء المدة سيتم إنهاء الجلسة مباشرة.',
                    ),
                    if (controller.state.isExamActive.value) ...[
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF4E5),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFFFCC80)),
                        ),
                        child: const Text(
                          'وضع الحماية مفعل الآن: الرجوع غير مسموح، والخروج من التطبيق ينهي الجلسة.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF8A5300),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RuleItem extends StatelessWidget {
  final String title;
  final String body;

  const _RuleItem({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Icon(Icons.circle, size: 8, color: Color(0xFF4F86F7)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  height: 1.7,
                  fontSize: 14,
                  color: Color(0xFF6A6A6A),
                ),
                children: [
                  TextSpan(
                    text: '$title ',
                    style: const TextStyle(
                      color: Color(0xFF4F86F7),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(text: body),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
