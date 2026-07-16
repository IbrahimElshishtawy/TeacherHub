import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/exams_rr_controller.dart';
import '../state/exams_rr_state.dart';
import 'student_result_details_screen.dart';

class ResultsAnalyticsDashboardScreen extends GetView<ExamsRRController> {
  const ResultsAnalyticsDashboardScreen({super.key});

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

  // ----------------------------------------------------
  // Automatic Parent Reports Dialog
  // ----------------------------------------------------
  void _openAutoReportsDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Obx(() {
              final reports = controller.state.value.enabledAutoReports;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.smart_toy_outlined, color: Color(0xFF7C3AED), size: 28),
                      SizedBox(width: 10),
                      Text(
                        "إشعار أولياء الأمور التلقائي",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "تفعيل إرسال التقارير الشهرية والنتائج الدورية تلقائياً لأولياء الأمور عبر واتساب الشات بوت.",
                    style: TextStyle(fontSize: 11, color: Colors.black54),
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 1, color: Color(0xFFE2E8F0)),
                  const SizedBox(height: 8),

                  ...reports.keys.map((key) {
                    final isEnabled = reports[key] ?? false;
                    return CheckboxListTile(
                      title: Text(key, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                      value: isEnabled,
                      dense: true,
                      activeColor: const Color(0xFF7C3AED),
                      onChanged: (val) => controller.toggleAutoReport(key),
                    );
                  }),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () => Get.back(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7C3AED),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text("حفظ الإعدادات", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------
  // Bulk Notifications Dialog
  // ----------------------------------------------------
  void _openBulkNotificationDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Directionality(
          textDirection: TextDirection.rtl,
          child: Text("إرسال جماعي للنتائج"),
        ),
        content: const Directionality(
          textDirection: TextDirection.rtl,
          child: Text("هل تود إرسال إشعارات النتائج لكافة الطلاب وأولياء أمورهم الآن؟ يمكنك اختيار القناة المفضلة."),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("إلغاء", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton.icon(
            onPressed: () {
              controller.notifyBulk("WhatsApp", "parent");
              Get.back();
            },
            icon: const Icon(Icons.chat_bubble_outline_rounded, size: 16),
            label: const Text("عبر WhatsApp"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
          ),
          ElevatedButton.icon(
            onPressed: () {
              controller.notifyBulk("Push Notification", "student");
              Get.back();
            },
            icon: const Icon(Icons.notifications_active_outlined, size: 16),
            label: const Text("إشعار تطبيق"),
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2563EB), foregroundColor: Colors.white),
          ),
        ],
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
            final results = controller.state.value.studentResults;

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
                              "لوحة تحكم النتائج والتحليلات",
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF1E293B)),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "متابعة أداء الطلاب، ومعدلات التسليم، وتصدير التقارير الورقية ورسائل أولياء الأمور.",
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

                // Actions buttons
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => _openBulkNotificationDialog(context),
                        icon: const Icon(Icons.send_rounded, size: 16),
                        label: const Text("إشعار جماعي بالنتائج", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
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
                        onPressed: () => _openAutoReportsDialog(context),
                        icon: const Icon(Icons.smart_toy_outlined, size: 18),
                        label: const Text("التقارير التلقائية", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF7C3AED),
                          side: const BorderSide(color: Color(0xFF7C3AED)),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      PopupMenuButton<String>(
                        onSelected: controller.exportResults,
                        icon: const Icon(Icons.download_rounded, color: Colors.green),
                        itemBuilder: (context) => [
                          const PopupMenuItem(value: "Excel", child: Text("تصدير Excel")),
                          const PopupMenuItem(value: "PDF", child: Text("تصدير PDF")),
                          const PopupMenuItem(value: "CSV", child: Text("تصدير CSV")),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Statistics row
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildStatCard("الطلاب المسلمين", "120 طالب", Icons.done_all, Colors.green),
                        const SizedBox(width: 8),
                        _buildStatCard("طلاب لم يبدأوا بعد", "30 طالب", Icons.hourglass_empty, Colors.orange),
                        const SizedBox(width: 8),
                        _buildStatCard("نسبة النجاح العامة", "88.5%", Icons.trending_up, const Color(0xFF2563EB)),
                        const SizedBox(width: 8),
                        _buildStatCard("متوسط زمن الحل", "42 دقيقة", Icons.timer_outlined, const Color(0xFF7C3AED)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Mock Charts Card
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                      boxShadow: const [
                        BoxShadow(color: Color(0x04000000), blurRadius: 12, offset: Offset(0, 6)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("مؤشرات الأداء والتحليلات العامة:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                        const SizedBox(height: 14),

                        // Score distribution bar simulation
                        const Text("توزيع درجات الطلاب:", style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              flex: 15,
                              child: Container(height: 8, color: Colors.green, child: const Tooltip(message: "امتياز")),
                            ),
                            Expanded(
                              flex: 40,
                              child: Container(height: 8, color: Colors.blue, child: const Tooltip(message: "جيد جداً")),
                            ),
                            Expanded(
                              flex: 30,
                              child: Container(height: 8, color: Colors.orange, child: const Tooltip(message: "مقبول")),
                            ),
                            Expanded(
                              flex: 15,
                              child: Container(height: 8, color: Colors.red, child: const Tooltip(message: "راسب")),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("امتياز (>90%): 15%", style: TextStyle(fontSize: 10, color: Colors.green, fontWeight: FontWeight.bold)),
                            Text("جيد جداً (75-90%): 40%", style: TextStyle(fontSize: 10, color: Colors.blue, fontWeight: FontWeight.bold)),
                            Text("مقبول (50-75%): 30%", style: TextStyle(fontSize: 10, color: Colors.orange, fontWeight: FontWeight.bold)),
                            Text("ضعيف (<50%): 15%", style: TextStyle(fontSize: 10, color: Colors.red, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Most Incorrect Questions
                        const Text("الأسئلة الأكثر صعوبة وتكراراً للخطأ:", style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("سؤال 3: معادلة تحضير غاز الميثان في المختبر بالتقطير الجاف...", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                                  Text("معدل الخطأ: 55%", style: TextStyle(fontSize: 11, color: Colors.red, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("سؤال 4: تتميز الألكينات بوجود رابطة ثنائية بين ذرتي كربون وتحتوي على...", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                                  Text("معدل الخطأ: 40%", style: TextStyle(fontSize: 11, color: Colors.red, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Student Results List
                const Text("سجل تسليمات الطلاب للتقييم:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                const SizedBox(height: 10),

                ...results.map((res) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      color: Colors.white,
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  res.studentName,
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: res.isPassed
                                        ? Colors.green.withValues(alpha: 0.1)
                                        : Colors.red.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    res.isPassed ? "ناجح" : "راسب",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: res.isPassed ? Colors.green : Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "الدرجة: ${res.score}/${res.totalScore} (${res.percentage}%) • الترتيب: ${res.rank}",
                                  style: const TextStyle(fontSize: 12, color: Color(0xFF475569)),
                                ),
                                Text(
                                  "زمن الحل: ${res.durationMinutes} دقيقة",
                                  style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    controller.notifyBulk("WhatsApp", "parent");
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    side: const BorderSide(color: Colors.green),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: const Text("إخطار ولي الأمر", style: TextStyle(fontSize: 11, color: Colors.green, fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () => Get.to(() => StudentResultDetailsScreen(result: res)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF2563EB),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: const Text("تحليل الإجابات التفصيلي", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
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
