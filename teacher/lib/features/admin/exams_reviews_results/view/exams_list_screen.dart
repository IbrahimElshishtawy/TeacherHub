import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/exams_rr_controller.dart';
import 'create_exam_wizard_screen.dart';
import 'question_bank_screen.dart';
import 'results_analytics_dashboard_screen.dart';

class ExamsListScreen extends GetView<ExamsRRController> {
  const ExamsListScreen({super.key});

  static const Color bg = Color(0xFFF8FAFC);

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 38,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(label, style: const TextStyle(fontSize: 12)),
          items: items.map((i) => DropdownMenuItem(value: i, child: Text(i, style: const TextStyle(fontSize: 12)))).toList(),
          onChanged: onChanged,
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
            final exams = controller.filteredExams;
            final stateVal = controller.state.value;

            // Stats calculations
            final total = stateVal.exams.length;
            final active = stateVal.exams.where((e) => e.status == "نشط").length;
            final scheduled = stateVal.exams.where((e) => e.status == "مجدول").length;
            final finished = stateVal.exams.where((e) => e.status == "منتهي").length;

            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 16),

                // Top Header Row
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "إدارة الاختبارات والواجبات",
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF1E293B)),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "تصميم وجدولة الاختبارات والواجبات، ومراقبة أداء الطلاب ونسب المشاركة.",
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
                const SizedBox(height: 16),

                // Top Action Buttons Row
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          controller.resetWizard();
                          Get.to(() => const CreateExamWizardScreen());
                        },
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text("إنشاء اختبار", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2563EB),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      OutlinedButton.icon(
                        onPressed: () {
                          Get.dialog(
                            AlertDialog(
                              title: const Text("استيراد أسئلة"),
                              content: const Text("يمكنك استيراد ملفات Word أو PDF، وسيقوم النظام باستخراج الأسئلة تلقائياً لتراجعها وتعدلها قبل النشر."),
                              actions: [
                                TextButton(onPressed: () => Get.back(), child: const Text("موافق")),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.upload_file_outlined, size: 18),
                        label: const Text("استيراد أسئلة", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF7C3AED),
                          side: const BorderSide(color: Color(0xFF7C3AED)),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () => Get.to(() => const QuestionBankScreen()),
                        icon: const Icon(Icons.folder_shared_outlined, color: Colors.orange),
                        tooltip: "بنك الأسئلة",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Statistics Row
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildStatCard("إجمالي الاختبارات", "$total", Icons.quiz_outlined, const Color(0xFF2563EB)),
                        const SizedBox(width: 8),
                        _buildStatCard("الاختبارات النشطة", "$active", Icons.play_circle_outline, Colors.green),
                        const SizedBox(width: 8),
                        _buildStatCard("المجدولة والمنتهية", "${scheduled + finished}", Icons.history, const Color(0xFF7C3AED)),
                        const SizedBox(width: 8),
                        _buildStatCard("متوسط الدرجات", "81.2%", Icons.grade_outlined, Colors.amber.shade700),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Search Box
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    onChanged: controller.setExamQuery,
                    decoration: InputDecoration(
                      hintText: "ابحث باسم الاختبار أو المادة...",
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Filters Choice chips
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterDropdown(
                          label: "الدفعة",
                          value: stateVal.selectedExamBatch,
                          items: const ["الكل", "Third Secondary 2026", "Third Secondary 2027", "Second Secondary", "First Secondary"],
                          onChanged: (val) => controller.setExamBatch(val ?? "الكل"),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterDropdown(
                          label: "نوع الاختبار",
                          value: stateVal.selectedExamType,
                          items: const ["الكل", "Quiz", "الواجب", "امتحان شهري", "امتحان نهائي", "مراجعة"],
                          onChanged: (val) => controller.setExamType(val ?? "الكل"),
                        ),
                        const SizedBox(width: 8),
                        _buildFilterDropdown(
                          label: "الحالة",
                          value: stateVal.selectedExamStatus,
                          items: const ["الكل", "نشط", "مجدول", "منتهي"],
                          onChanged: (val) => controller.setExamStatus(val ?? "الكل"),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Exam Cards List
                ...exams.map((exam) {
                  Color statusColor = Colors.grey;
                  if (exam.status == "نشط") statusColor = Colors.green;
                  if (exam.status == "مجدول") statusColor = const Color(0xFF7C3AED);

                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: Colors.white,
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: statusColor.withValues(alpha: 0.1),
                                  child: Text(
                                    exam.type == "الواجب" ? "📝" : "🏆",
                                    style: const TextStyle(fontSize: 22),
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        exam.name,
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "${exam.subject} • ${exam.grade} • ${exam.batch}",
                                        style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        "${exam.chapter} - ${exam.lesson}",
                                        style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: statusColor.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    exam.status,
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: statusColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            const Divider(height: 1, color: Color(0xFFE2E8F0)),
                            const SizedBox(height: 14),

                            // Exam Stats Info Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("نوع التقييم: ${exam.type}", style: const TextStyle(fontSize: 12, color: Color(0xFF334155))),
                                    const SizedBox(height: 4),
                                    Text("الأسئلة: ${exam.questionCount} سؤال • الدرجة: ${exam.totalMarks} درجة", style: const TextStyle(fontSize: 12, color: Color(0xFF475569))),
                                    const SizedBox(height: 4),
                                    Text("متاح من: ${exam.availableFrom}", style: const TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                                    Text("متاح إلى: ${exam.availableUntil}", style: const TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("مدة الامتحان: ${exam.durationMinutes} دقيقة", style: const TextStyle(fontSize: 12, color: Color(0xFF334155))),
                                    const SizedBox(height: 4),
                                    Text("الطلاب المسندين: ${exam.studentsAssignedCount}", style: const TextStyle(fontSize: 12, color: Color(0xFF475569))),
                                    const SizedBox(height: 4),
                                    Text("المشاركات المستلمة: ${exam.submissionCount}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF2563EB))),
                                    Text("متوسط درجات الطلاب: ${exam.avgScore}/${exam.totalMarks}", style: const TextStyle(fontSize: 11, color: Colors.green, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // Actions
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    Get.dialog(
                                      AlertDialog(
                                        title: const Text("تعديل الاختبار"),
                                        content: Text("شاشة تعديل بيانات الامتحان: ${exam.name}"),
                                        actions: [
                                          TextButton(onPressed: () => Get.back(), child: const Text("موافق")),
                                        ],
                                      ),
                                    );
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                                    side: const BorderSide(color: Color(0xFF64748B)),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: const Text("تعديل", style: TextStyle(fontSize: 12, color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(width: 8),
                                PopupMenuButton<String>(
                                  onSelected: (val) {
                                    if (val == "duplicate") controller.duplicateExam(exam);
                                    if (val == "hide") controller.hideExam(exam);
                                    if (val == "delete") controller.deleteExam(exam);
                                    if (val == "assign") {
                                      Get.snackbar("إسناد دفعة", "فتح نافذة إسناد الاختبار لدفعة إضافية.");
                                    }
                                  },
                                  itemBuilder: (context) => [
                                    const PopupMenuItem(
                                      value: "duplicate",
                                      child: Row(
                                        children: [
                                          Icon(Icons.copy_rounded, size: 18),
                                          SizedBox(width: 8),
                                          Text("تكرار الاختبار"),
                                        ],
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: "hide",
                                      child: Row(
                                        children: [
                                          Icon(Icons.visibility_off_outlined, size: 18),
                                          SizedBox(width: 8),
                                          Text("إخفاء عن الطلاب"),
                                        ],
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: "assign",
                                      child: Row(
                                        children: [
                                          Icon(Icons.person_add_alt_1_outlined, size: 18),
                                          SizedBox(width: 8),
                                          Text("إسناد دفعة جديدة"),
                                        ],
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: "delete",
                                      child: Row(
                                        children: [
                                          Icon(Icons.delete_outline, color: Colors.red, size: 18),
                                          SizedBox(width: 8),
                                          Text("حذف الاختبار", style: TextStyle(color: Colors.red)),
                                        ],
                                      ),
                                    ),
                                  ],
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: const Color(0xFFE2E8F0)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text("المزيد", style: TextStyle(fontSize: 12, color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () => Get.to(() => const ResultsAnalyticsDashboardScreen()),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF2563EB),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: const Text("عرض النتائج", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ],
                        ),
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
