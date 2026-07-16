import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/exams_rr_controller.dart';
import 'exams_list_screen.dart';
import 'reviews_list_screen.dart';
import 'question_bank_screen.dart';
import 'results_analytics_dashboard_screen.dart';

class ExamsRRScreen extends GetView<ExamsRRController> {
  const ExamsRRScreen({super.key});

  static const Color bg = Color(0xFFF8FAFC);

  Widget _buildModuleCard({
    required String title,
    required String subtitle,
    required String stats,
    required String lastUpdated,
    required String emoji,
    required Color color,
    required VoidCallback onTap,
    required VoidCallback onQuickAction,
    required String quickActionText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            emoji,
                            style: const TextStyle(fontSize: 26),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              subtitle,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF64748B),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Divider(height: 1, color: Color(0xFFF1F5F9)),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stats,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "آخر تحديث: $lastUpdated",
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF94A3B8),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: onQuickAction,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: color,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          quickActionText,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Obx(() {
              final st = controller.state.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // Top Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Get.offAllNamed('/home_admin'),
                        icon: const Icon(Icons.arrow_forward_ios, size: 22, color: Color(0xFF1E293B)),
                      ),
                      const Icon(
                        Icons.analytics_outlined,
                        size: 28,
                        color: Color(0xFF2563EB),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Title & Subtitle
                  const Text(
                    "مركز التقييمات التعليمية",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "إدارة وتصميم الاختبارات، ومتابعة حزم المراجعة، وتحليل أداء وتقارير الطلاب.",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Scrollable Modules Cards
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildModuleCard(
                          title: "الاختبارات والواجبات",
                          subtitle: "إنشاء الاختبارات القصيرة، والواجبات والامتحانات الشهرية والشاملة وتعديلها.",
                          stats: "عدد الاختبارات: ${st.examsCount} اختبار",
                          lastUpdated: "اليوم 09:30 ص",
                          emoji: "📝",
                          color: const Color(0xFF2563EB),
                          onTap: () => Get.to(() => const ExamsListScreen()),
                          quickActionText: "+ إنشاء اختبار",
                          onQuickAction: () {
                            controller.resetWizard();
                            Get.to(() => const CreateExamWizardScreen());
                          },
                        ),
                        _buildModuleCard(
                          title: "المراجعات الدراسية",
                          subtitle: "إدارة وتعديل حزم المراجعة التفاعلية والملخصات والملفات المرفقة.",
                          stats: "حزم المراجعة: ${st.reviewsCount} حزمة",
                          lastUpdated: "أمس 04:00 م",
                          emoji: "📚",
                          color: const Color(0xFF7C3AED),
                          onTap: () => Get.to(() => const ReviewsListScreen()),
                          quickActionText: "عرض المراجعات",
                          onQuickAction: () => Get.to(() => const ReviewsListScreen()),
                        ),
                        _buildModuleCard(
                          title: "النتائج والتحليلات",
                          subtitle: "عرض درجات الاختبارات، ونسب النجاح، وتحليل الأسئلة وإرسال تقارير أولياء الأمور.",
                          stats: "إجمالي المشاركات: ${st.resultsCount} تسليم",
                          lastUpdated: "منذ ساعتين",
                          emoji: "📊",
                          color: Colors.green.shade600,
                          onTap: () => Get.to(() => const ResultsAnalyticsDashboardScreen()),
                          quickActionText: "لوحة التحكم",
                          onQuickAction: () => Get.to(() => const ResultsAnalyticsDashboardScreen()),
                        ),
                        _buildModuleCard(
                          title: "بنك الأسئلة",
                          subtitle: "تصفح مجلدات الأسئلة المصنفة حسب الأبواب والدروس مع إضافة وتعديل الأسئلة.",
                          stats: "الأسئلة بالبنك: ${st.questionBankCount} سؤال",
                          lastUpdated: "2026/07/12",
                          emoji: "📂",
                          color: Colors.orange.shade700,
                          onTap: () => Get.to(() => const QuestionBankScreen()),
                          quickActionText: "تصفح المجلدات",
                          onQuickAction: () => Get.to(() => const QuestionBankScreen()),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
