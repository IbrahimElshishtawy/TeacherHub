import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/exams_rr_controller.dart';
import '../state/exams_rr_state.dart';

class QuestionBankScreen extends GetView<ExamsRRController> {
  const QuestionBankScreen({super.key});

  static const Color bg = Color(0xFFF8FAFC);

  Widget _buildDifficultyChip(String label, int count, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Text(
        "$label: $count",
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }

  void _openAddQuestionDialog(BuildContext context, QuestionFolderModel folder) {
    final textController = TextEditingController();
    final option1Controller = TextEditingController();
    final option2Controller = TextEditingController();
    final option3Controller = TextEditingController();
    final option4Controller = TextEditingController();

    String selectedDifficulty = "سهل";
    String selectedType = "اختيار من متعدد";

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: StatefulBuilder(
              builder: (context, setState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.add_task, color: Colors.orange, size: 28),
                          SizedBox(width: 10),
                          Text(
                            "إضافة سؤال جديد للبنك",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(height: 1, color: Color(0xFFE2E8F0)),
                      const SizedBox(height: 14),

                      TextField(
                        controller: textController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          labelText: "نص السؤال",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 12),

                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(labelText: "نوع السؤال", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                        value: selectedType,
                        items: const [
                          DropdownMenuItem(value: "اختيار من متعدد", child: Text("اختيار من متعدد")),
                          DropdownMenuItem(value: "صواب وخطأ", child: Text("صواب وخطأ")),
                          DropdownMenuItem(value: "مقالي", child: Text("مقالي")),
                        ],
                        onChanged: (val) {
                          if (val != null) setState(() => selectedType = val);
                        },
                      ),
                      const SizedBox(height: 12),

                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(labelText: "مستوى الصعوبة", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                        value: selectedDifficulty,
                        items: const [
                          DropdownMenuItem(value: "سهل", child: Text("سهل")),
                          DropdownMenuItem(value: "متوسط", child: Text("متوسط")),
                          DropdownMenuItem(value: "صعب", child: Text("صعب")),
                        ],
                        onChanged: (val) {
                          if (val != null) setState(() => selectedDifficulty = val);
                        },
                      ),
                      const SizedBox(height: 12),

                      if (selectedType == "اختيار من متعدد") ...[
                        const Text("خيارات الإجابة:", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        TextField(controller: option1Controller, decoration: const InputDecoration(labelText: "خيار أ (الصحيح)")),
                        TextField(controller: option2Controller, decoration: const InputDecoration(labelText: "خيار ب")),
                        TextField(controller: option3Controller, decoration: const InputDecoration(labelText: "خيار ج")),
                        TextField(controller: option4Controller, decoration: const InputDecoration(labelText: "خيار د")),
                        const SizedBox(height: 16),
                      ],

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text("إلغاء", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              final text = textController.text.trim();
                              if (text.isEmpty) {
                                Get.snackbar("خطأ", "يرجى كتابة نص السؤال");
                                return;
                              }

                              final options = selectedType == "اختيار من متعدد"
                                  ? [
                                      option1Controller.text.trim(),
                                      option2Controller.text.trim(),
                                      option3Controller.text.trim(),
                                      option4Controller.text.trim()
                                    ]
                                  : <String>[];

                              final newQ = QuestionModel(
                                id: "Q-${DateTime.now().millisecondsSinceEpoch}",
                                text: text,
                                type: selectedType,
                                options: options,
                                correctAnswer: selectedType == "اختيار من متعدد" ? option1Controller.text.trim() : "صواب",
                                difficulty: selectedDifficulty,
                                marks: 2,
                              );

                              controller.addQuestionToFolder(folder, newQ);
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange.shade700,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text("حفظ بالبنك", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
                  );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Obx(() {
            final folders = controller.state.value.questionFolders;

            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 16),

                // Header
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "بنك الأسئلة التعليمي",
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF1E293B)),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "تصفح مجلدات الأسئلة المصنفة حسب الأبواب والدروس، وقم بتوليد اختبارات عشوائية بنقرة واحدة.",
                              style: TextStyle(fontSize: 12, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Folder List
                ...folders.map((folder) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.folder_rounded, color: Colors.amber, size: 40),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      folder.chapter,
                                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      folder.lesson,
                                      style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "${folder.questionCount} سؤال",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange.shade800),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Divider(height: 1, color: Color(0xFFF1F5F9)),
                          const SizedBox(height: 12),

                          // Difficulty metrics
                          Row(
                            children: [
                              _buildDifficultyChip("سهل", folder.easyCount, Colors.green),
                              const SizedBox(width: 8),
                              _buildDifficultyChip("متوسط", folder.mediumCount, Colors.blue),
                              const SizedBox(width: 8),
                              _buildDifficultyChip("صعب", folder.hardCount, Colors.red),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Inner Questions List Preview
                          const Text("معاينة الأسئلة بالجلد:", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF475569))),
                          const SizedBox(height: 6),
                          ...folder.questions.map((q) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8FAFC),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      q.text,
                                      style: const TextStyle(fontSize: 12, color: Color(0xFF1E293B)),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    q.difficulty,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: q.difficulty == "سهل"
                                          ? Colors.green
                                          : (q.difficulty == "متوسط" ? Colors.blue : Colors.red),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline, color: Colors.red, size: 18),
                                    onPressed: () => controller.deleteQuestionFromFolder(folder, q),
                                  ),
                                ],
                              ),
                            );
                          }),
                          const SizedBox(height: 12),

                          // Action Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton.icon(
                                onPressed: () {
                                  Get.dialog(
                                    AlertDialog(
                                      title: const Text("توليد اختبار عشوائي"),
                                      content: Text("هل تود توليد اختبار عشوائي تلقائياً بـ 15 سؤال من مجلد: (${folder.lesson})؟"),
                                      actions: [
                                        TextButton(onPressed: () => Get.back(), child: const Text("إلغاء")),
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                            Get.snackbar("توليد عشوائي", "تم توليد ونشر الاختبار العشوائي بنجاح في لوحة التحكم.", backgroundColor: Colors.green, colorText: Colors.white);
                                          },
                                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                                          child: const Text("توليد الآن"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.auto_awesome, size: 16),
                                label: const Text("توليد اختبار عشوائي", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.green,
                                  side: const BorderSide(color: Colors.green),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton.icon(
                                onPressed: () => _openAddQuestionDialog(context, folder),
                                icon: const Icon(Icons.add, size: 16),
                                label: const Text("إضافة سؤال", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange.shade700,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 30),
              ],
            );
          }),
        ),
      ),
    );
  }
}
