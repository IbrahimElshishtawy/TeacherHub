import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/exams_rr_controller.dart';
import '../state/exams_rr_state.dart';

class CreateExamWizardScreen extends GetView<ExamsRRController> {
  const CreateExamWizardScreen({super.key});

  static const Color bg = Color(0xFFF8FAFC);

  Widget _buildStepIndicator(int stepIndex, String title, int currentStep) {
    bool isCompleted = stepIndex < currentStep;
    bool isActive = stepIndex == currentStep;

    Color color = const Color(0xFF94A3B8);
    if (isActive) color = const Color(0xFF2563EB);
    if (isCompleted) color = Colors.green;

    return Expanded(
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isCompleted ? Colors.green : (isActive ? const Color(0xFF2563EB) : Colors.white),
              shape: BoxShape.circle,
              border: Border.all(color: isActive ? const Color(0xFF2563EB) : const Color(0xFFE2E8F0), width: 2),
            ),
            child: Center(
              child: isCompleted
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : Text(
                      "${stepIndex + 1}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isActive ? Colors.white : const Color(0xFF64748B),
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? const Color(0xFF1E293B) : const Color(0xFF64748B),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------
  // Wizards Forms
  // ----------------------------------------------------
  Widget _buildStep1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("1. معلومات التقييم الأساسية", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 14),
        TextField(
          decoration: InputDecoration(
            labelText: "عنوان الاختبار / الواجب",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onChanged: (val) => controller.updateTempWizardData("name", val),
        ),
        const SizedBox(height: 12),
        TextField(
          maxLines: 2,
          decoration: InputDecoration(
            labelText: "وصف أو تعليمات الاختبار للطلاب",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onChanged: (val) => controller.updateTempWizardData("desc", val),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: "المادة الدراسية", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                value: "الكيمياء",
                items: const [DropdownMenuItem(value: "الكيمياء", child: Text("الكيمياء"))],
                onChanged: (val) => controller.updateTempWizardData("subject", val),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: "نوع التقييم", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                value: "امتحان شهري",
                items: const [
                  DropdownMenuItem(value: "Quiz", child: Text("Quiz")),
                  DropdownMenuItem(value: "الواجب", child: Text("الواجب")),
                  DropdownMenuItem(value: "امتحان شهري", child: Text("امتحان شهري")),
                  DropdownMenuItem(value: "امتحان نهائي", child: Text("امتحان نهائي")),
                ],
                onChanged: (val) => controller.updateTempWizardData("type", val),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "المدة بالدقائق",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (val) => controller.updateTempWizardData("duration", int.tryParse(val) ?? 30),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "درجة النجاح من 100",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (val) => controller.updateTempWizardData("pass_score", int.tryParse(val) ?? 50),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "تاريخ البدء المتاح",
                  hintText: "YYYY/MM/DD",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (val) => controller.updateTempWizardData("start_date", val),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "تاريخ الانتهاء المغلق",
                  hintText: "YYYY/MM/DD",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (val) => controller.updateTempWizardData("end_date", val),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStep2(BuildContext context) {
    final batches = ["Third Secondary 2026", "Third Secondary 2027", "Second Secondary", "First Secondary"];
    final selectedBatches = <String>[].obs;

    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("2. اختيار الفئة المستهدفة من الطلاب", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 14),
        const Text("إرسال التقييم إلى:", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...batches.map((batch) {
          final isSelected = selectedBatches.contains(batch);
          return CheckboxListTile(
            title: Text(batch, style: const TextStyle(fontSize: 13)),
            value: isSelected,
            activeColor: const Color(0xFF2563EB),
            onChanged: (val) {
              if (val == true) {
                selectedBatches.add(batch);
              } else {
                selectedBatches.remove(batch);
              }
              controller.updateTempWizardData("target_batches", selectedBatches.toList());
            },
          );
        }),
      ],
    ));
  }

  Widget _buildStep3(BuildContext context) {
    final sources = ["إدخال يدوي للأسئلة", "استيراد ملف Word كلياً", "استيراد ملف PDF ذكياً", "سحب عشوائي من بنك الأسئلة"];
    final selectedSource = "".obs;

    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("3. مصدر الأسئلة والتحميل الذكي", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        const Text(
          "يدعم النظام استخراج الأسئلة تلقائياً عند رفع ملفات Word أو PDF لتوفير وقت المعلم.",
          style: TextStyle(fontSize: 11, color: Colors.black54),
        ),
        const SizedBox(height: 14),
        ...sources.map((src) {
          final isSelected = selectedSource.value == src;
          return RadioListTile<String>(
            title: Text(src, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            value: src,
            groupValue: selectedSource.value,
            activeColor: const Color(0xFF2563EB),
            onChanged: (val) {
              if (val != null) {
                selectedSource.value = val;
                controller.updateTempWizardData("question_source", val);

                if (val.contains("ملف")) {
                  Get.dialog(
                    AlertDialog(
                      title: const Text("تحميل الملف"),
                      content: Text("جاري معالجة واستخراج الأسئلة من ملف ($val) عبر الذكاء الاصطناعي..."),
                      actions: [
                        TextButton(onPressed: () => Get.back(), child: const Text("موافق")),
                      ],
                    ),
                  );
                }
              }
            },
          );
        }),
      ],
    ));
  }

  Widget _buildStep4(BuildContext context) {
    final settings = <String, bool>{
      "ترتيب عشوائي للأسئلة": true,
      "ترتيب عشوائي للإجابات لكل طالب": true,
      "عرض الدرجة مباشرة بعد انتهاء التقييم": true,
      "عرض الإجابات الصحيحة للطلاب بعد التسليم": true,
      "منع العودة للوراء أثناء حل التقييم": false,
      "تفعيل تسليم الامتحان التلقائي عند انتهاء الموقت": true,
      "السماح بأكثر من محاولة للحل": false,
    }.obs;

    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("4. إعدادات وقواعد التقييم", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 14),
        ...settings.keys.map((key) {
          final isVal = settings[key] ?? false;
          return SwitchListTile(
            title: Text(key, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            value: isVal,
            activeColor: const Color(0xFF2563EB),
            onChanged: (val) {
              settings[key] = val;
              controller.updateTempWizardData("settings_$key", val);
            },
          );
        }),
      ],
    ));
  }

  Widget _buildStep5(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("5. معاينة ونشر الاختبار", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("ملخص الامتحان المكتمل:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF2563EB))),
              const SizedBox(height: 10),
              Text("اسم التقييم: ${controller.state.value.tempWizardData['name'] ?? 'امتحان كيمياء تجريبي'}", style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text("نوع التقييم: ${controller.state.value.tempWizardData['type'] ?? 'امتحان شهري'}", style: const TextStyle(fontSize: 12)),
              const SizedBox(height: 4),
              Text("المدة المقررة: ${controller.state.value.tempWizardData['duration'] ?? 45} دقيقة", style: const TextStyle(fontSize: 12)),
              const SizedBox(height: 4),
              Text("طريقة التحميل: ${controller.state.value.tempWizardData['question_source'] ?? 'سحب عشوائي من بنك الأسئلة'}", style: const TextStyle(fontSize: 12)),
              const SizedBox(height: 4),
              Text("الدفعة المستهدفة: ${controller.state.value.tempWizardData['target_batches'] ?? 'Third Secondary 2026'}", style: const TextStyle(fontSize: 12, color: Colors.blueGrey)),
            ],
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: () {
            // Save & Publish
            final name = controller.state.value.tempWizardData['name'] ?? 'امتحان كيمياء تجريبي الجديد';
            final type = controller.state.value.tempWizardData['type'] ?? 'امتحان شهري';
            final duration = controller.state.value.tempWizardData['duration'] ?? 45;
            final batches = controller.state.value.tempWizardData['target_batches'] ?? ['Third Secondary 2026'];

            final newExam = ExamModel(
              id: "EX-${300 + controller.state.value.exams.length + 1}",
              name: name,
              subject: "الكيمياء",
              grade: "الصف الثالث الثانوي",
              batch: batches.isNotEmpty ? batches.first : "Third Secondary 2026",
              chapter: "الباب الخامس",
              lesson: "شامل",
              type: type,
              questionCount: 15,
              totalMarks: 30,
              durationMinutes: duration,
              availableFrom: "2026/07/18 09:00 ص",
              availableUntil: "2026/07/20 09:00 م",
              studentsAssignedCount: 150,
              submissionCount: 0,
              avgScore: 0.0,
              status: "مجدول",
            );

            controller.createNewExam(newExam);
            Get.back(); // close wizard
          },
          icon: const Icon(Icons.send),
          label: const Text("نشر التقييم الآن للطلاب", style: TextStyle(fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(() {
              final step = controller.state.value.wizardStep;

              return Column(
                children: [
                  const SizedBox(height: 16),

                  // Header wizard title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                      const Text(
                        "معالج إنشاء التقييم الذكي",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                      ),
                      const SizedBox(width: 48), // spacer
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Step Indicators Bar
                  Row(
                    children: [
                      _buildStepIndicator(0, "المعلومات", step),
                      _buildStepIndicator(1, "الطلاب", step),
                      _buildStepIndicator(2, "المصدر", step),
                      _buildStepIndicator(3, "القواعد", step),
                      _buildStepIndicator(4, "النشر", step),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(height: 1, color: Color(0xFFE2E8F0)),
                  const SizedBox(height: 20),

                  // Steps Content
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          if (step == 0) _buildStep1(context),
                          if (step == 1) _buildStep2(context),
                          if (step == 2) _buildStep3(context),
                          if (step == 3) _buildStep4(context),
                          if (step == 4) _buildStep5(context),
                        ],
                      ),
                    ),
                  ),

                  // Bottom buttons navigation
                  if (step < 4) ...[
                    Row(
                      children: [
                        if (step > 0)
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => controller.prevWizardStep(),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Color(0xFF94A3B8)),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: const Text("السابق", style: TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
                            ),
                          )
                        else
                          const Spacer(),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => controller.nextWizardStep(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2563EB),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: const Text("التالي", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
