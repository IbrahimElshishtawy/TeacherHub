import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/exams_rr_controller.dart';
import '../state/exams_rr_state.dart';

class ReviewsListScreen extends GetView<ExamsRRController> {
  const ReviewsListScreen({super.key});

  static const Color bg = Color(0xFFF8FAFC);

  void _openAddReviewDialog(BuildContext context) {
    final titleController = TextEditingController();
    final summaryController = TextEditingController();
    final videoController = TextEditingController();
    final pdfController = TextEditingController();

    String selectedBatch = "Third Secondary 2026";
    String selectedChapter = "الباب الخامس";

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
                          Icon(Icons.video_library_outlined, color: Color(0xFF7C3AED), size: 28),
                          SizedBox(width: 10),
                          Text(
                            "إنشاء حزمة مراجعة جديدة",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(height: 1, color: Color(0xFFE2E8F0)),
                      const SizedBox(height: 14),

                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: "عنوان حزمة المراجعة",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 12),

                      TextField(
                        controller: summaryController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          labelText: "ملخص أو وصف المراجعة",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 12),

                      TextField(
                        controller: videoController,
                        decoration: InputDecoration(
                          labelText: "رابط فيديو الشرح (YouTube/Drive)",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 12),

                      TextField(
                        controller: pdfController,
                        decoration: InputDecoration(
                          labelText: "اسم ملف الملخص المرفق (PDF)",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 16),

                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(labelText: "الدفعة المستهدفة", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                        value: selectedBatch,
                        items: const [
                          DropdownMenuItem(value: "Third Secondary 2026", child: Text("Third Secondary 2026")),
                          DropdownMenuItem(value: "Third Secondary 2027", child: Text("Third Secondary 2027")),
                          DropdownMenuItem(value: "Second Secondary", child: Text("Second Secondary")),
                        ],
                        onChanged: (val) {
                          if (val != null) setState(() => selectedBatch = val);
                        },
                      ),
                      const SizedBox(height: 12),

                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(labelText: "الباب / الجزء", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                        value: selectedChapter,
                        items: const [
                          DropdownMenuItem(value: "الباب الأول", child: Text("الباب الأول")),
                          DropdownMenuItem(value: "الباب الخامس", child: Text("الباب الخامس")),
                        ],
                        onChanged: (val) {
                          if (val != null) setState(() => selectedChapter = val);
                        },
                      ),
                      const SizedBox(height: 20),

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
                              final title = titleController.text.trim();
                              if (title.isEmpty) {
                                Get.snackbar("خطأ", "يرجى كتابة عنوان حزمة المراجعة");
                                return;
                              }

                              final newPackage = ReviewPackageModel(
                                id: "REV-${DateTime.now().millisecondsSinceEpoch}",
                                title: title,
                                subject: "الكيمياء",
                                batch: selectedBatch,
                                chapter: selectedChapter,
                                lesson: "كامل الدرس",
                                videoUrl: videoController.text.trim(),
                                pdfNotesName: pdfController.text.trim(),
                                summary: summaryController.text.trim(),
                                assignmentsCount: 1,
                                practiceQuestionsCount: 10,
                                examTitle: "اختبار مراجعة تجريبي",
                                attachments: [pdfController.text.trim()],
                              );

                              controller.addReviewPackage(newPackage);
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7C3AED),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text("حفظ ونشر الحزمة", style: TextStyle(fontWeight: FontWeight.bold)),
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
            final reviews = controller.state.value.reviewPackages;

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
                              "إدارة المراجعات التعليمية",
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF1E293B)),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "نشر فيديوهات الشرح، وملخصات الـ PDF، والواجبات والاختبارات التابعة للمراجعة كحزمة متكاملة.",
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

                // Action Buttons Row
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => _openAddReviewDialog(context),
                        icon: const Icon(Icons.video_call_outlined, size: 18),
                        label: const Text("إضافة حزمة مراجعة", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7C3AED),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Review Packages Cards
                ...reviews.map((package) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 20),
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
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: const Color(0xFF7C3AED).withValues(alpha: 0.1),
                                  child: const Text("📚", style: TextStyle(fontSize: 22)),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        package.title,
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "${package.subject} • ${package.batch} • ${package.chapter}",
                                        style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                                  onPressed: () => controller.deleteReviewPackage(package),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Divider(height: 1, color: Color(0xFFE2E8F0)),
                            const SizedBox(height: 12),

                            // Description Summary
                            Text(
                              package.summary,
                              style: const TextStyle(fontSize: 12, color: Color(0xFF475569), height: 1.4),
                            ),
                            const SizedBox(height: 14),

                            // Package Included Components Layout
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(Icons.play_circle_fill, color: Colors.red, size: 16),
                                      SizedBox(width: 6),
                                      Text("فيديو الشرح متضمن", style: TextStyle(fontSize: 11, color: Colors.red, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(color: Colors.blue.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.picture_as_pdf, color: Colors.blue, size: 16),
                                      const SizedBox(width: 6),
                                      Text(package.pdfNotesName, style: const TextStyle(fontSize: 11, color: Colors.blue, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(color: Colors.green.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.assignment_outlined, color: Colors.green, size: 16),
                                      const SizedBox(width: 6),
                                      Text("${package.assignmentsCount} واجبات • ${package.practiceQuestionsCount} سؤال", style: const TextStyle(fontSize: 11, color: Colors.green, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // Attachments List View
                            if (package.attachments.isNotEmpty) ...[
                              const Text("الملفات المرفقة للتحميل:", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF64748B))),
                              const SizedBox(height: 6),
                              ...package.attachments.map((file) => Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 2),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.attach_file, size: 14, color: Color(0xFF94A3B8)),
                                        const SizedBox(width: 6),
                                        Text(file, style: const TextStyle(fontSize: 11, color: Color(0xFF475569))),
                                      ],
                                    ),
                                  )),
                              const SizedBox(height: 16),
                            ],

                            // Action buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    Get.dialog(
                                      AlertDialog(
                                        title: const Text("تعديل المحتوى"),
                                        content: Text("شاشة إدارة محتوى حزمة المراجعة: ${package.title}"),
                                        actions: [
                                          TextButton(onPressed: () => Get.back(), child: const Text("موافق")),
                                        ],
                                      ),
                                    );
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                                    side: const BorderSide(color: Color(0xFF7C3AED)),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: const Text("إدارة المحتوى", style: TextStyle(fontSize: 12, color: Color(0xFF7C3AED), fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(width: 8),
                                OutlinedButton(
                                  onPressed: () {
                                    Get.snackbar("إسناد الحزمة", "فتح نافذة إسناد حزمة المراجعة لدفعة إضافية.");
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                                    side: const BorderSide(color: Color(0xFF64748B)),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: const Text("إسناد دفعة", style: TextStyle(fontSize: 12, color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.dialog(
                                      AlertDialog(
                                        title: const Text("معاينة الحزمة"),
                                        content: Text("شاشة معاينة الطالب لحزمة المراجعة: ${package.title}"),
                                        actions: [
                                          TextButton(onPressed: () => Get.back(), child: const Text("إغلاق المعاينة")),
                                        ],
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF7C3AED),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: const Text("معاينة", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
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
