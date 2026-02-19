import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../controller/exams_rr_controller.dart';
import 'section_card.dart';

class SectionsList extends GetView<ExamsRRController> {
  const SectionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final st = controller.state.value;

      return Column(
        children: [
          SectionCard(
            title: "الاختبارات",
            subtitle: "إنشاء، إدارة، وجدولة الاختبارات للطلاب.",
            countText: "عدد الاختبارات: ${st.examsCount} اختبار",
            icon: LucideIcons.clipboardList,
            iconColor: const Color(0xFF2F6BFF),
            onTap: controller.goToExams,
          ),
          const SizedBox(height: 12),
          SectionCard(
            title: "المراجعات",
            subtitle: "إدارة المراجعات والدروس التحضيرية.",
            countText: "عدد المراجعات: ${st.reviewsCount} مراجعات",
            icon: LucideIcons.bookOpenCheck,
            iconColor: const Color(0xFF19B66A),
            onTap: controller.goToReviews,
          ),
          const SizedBox(height: 12),
          SectionCard(
            title: "النتائج",
            subtitle: "متابعة نتائج الطلاب وتحليل مستوى الأداء.",
            countText: "نتائج مسجلة: ${st.resultsCount} نتيجة",
            icon: LucideIcons.award,
            iconColor: const Color(0xFF00A3A3),
            onTap: controller.goToResults,
          ),
        ],
      );
    });
  }
}
