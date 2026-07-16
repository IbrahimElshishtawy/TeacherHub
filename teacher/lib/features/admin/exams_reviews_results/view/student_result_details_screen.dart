import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/exams_rr_controller.dart';
import '../state/exams_rr_state.dart';

class StudentResultDetailsScreen extends GetView<ExamsRRController> {
  final StudentResultModel result;

  const StudentResultDetailsScreen({super.key, required this.result});

  static const Color bg = Color(0xFFF8FAFC);

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF64748B))),
          Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Note controller initialized with existing feedback notes (mocking the first question notes)
    final initialNotes = result.questionAnalyses.isNotEmpty ? result.questionAnalyses.first.teacherNotes : "";
    final notesController = TextEditingController(text: initialNotes);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 16),

                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_forward_ios, size: 20),
                    ),
                    const Text(
                      "تحليل إجابات الطالب بالتفصيل",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                    ),
                    const SizedBox(width: 48), // spacer
                  ],
                ),
                const SizedBox(height: 16),

                // Student Identity Card
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 22,
                            backgroundColor: Color(0xFF2563EB),
                            child: Text("👨‍🎓", style: TextStyle(fontSize: 18)),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  result.studentName,
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  result.batch,
                                  style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2563EB).withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "الترتيب: #${result.rank}",
                              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF2563EB)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(height: 1, color: Color(0xFFF1F5F9)),
                      const SizedBox(height: 12),

                      _buildInfoRow("الامتحان التعليمي", result.examName),
                      _buildInfoRow("تاريخ ووقت التسليم", result.submissionTime),
                      _buildInfoRow("الوقت المستغرق للحل", "${result.durationMinutes} دقيقة"),
                      _buildInfoRow("الدرجة الإجمالية الحاصل عليها", "${result.score} / ${result.totalScore} (${result.percentage}%)"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Question by Question Breakdown
                const Text("تحليل الأسئلة والأجوبة:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                const SizedBox(height: 10),

                ...result.questionAnalyses.map((q) {
                  bool isCorrect = q.marksObtained > 0;
                  Color qColor = isCorrect ? Colors.green : Colors.red;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: qColor.withValues(alpha: 0.2), width: 1.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "الدرجة: ${q.marksObtained}/${q.totalMarks}",
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: qColor),
                            ),
                            Text(
                              "زمن الحل: ${q.timeSpentSeconds} ثانية",
                              style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        Text(
                          q.questionText,
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1E293B), height: 1.4),
                        ),
                        const SizedBox(height: 12),

                        // Student vs Correct Answer Layout
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text("إجابة الطالب: ", style: TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                                  Text(
                                    q.studentAnswer.isNotEmpty ? q.studentAnswer : "لم يقم بالحل",
                                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: qColor),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Text("الإجابة النموذجية: ", style: TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                                  Text(
                                    q.correctAnswer,
                                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        if (q.teacherNotes.isNotEmpty) ...[
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: [
                                const Icon(Icons.feedback_outlined, size: 14, color: Colors.amber),
                                const SizedBox(width: 6),
                                Expanded(child: Text("ملاحظة المعلم: ${q.teacherNotes}", style: TextStyle(fontSize: 11, color: Colors.amber.shade900))),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 20),

                // Teacher Feedback Notes Editor
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "إرسال تقييم المعلم وملاحظات المراجعة للولي:",
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: notesController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: "اكتب هنا توجيهاتك أو ملاحظاتك لولي الأمر حول إجابة الطالب وتوصيات التحسين...",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () {
                          controller.saveTeacherFeedback(result, notesController.text.trim());
                        },
                        icon: const Icon(Icons.check_circle_outline),
                        label: const Text("حفظ وإرسال الملاحظات", style: TextStyle(fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2563EB),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
