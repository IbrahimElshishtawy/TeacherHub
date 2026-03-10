import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/subject_controller.dart';
import '../state/subject_state.dart';
import '../widgets/subject_course_card.dart';
import '../widgets/subject_exam_preview_card.dart';
import '../widgets/subject_header.dart';
import '../widgets/subject_quick_card.dart';
import '../widgets/subject_search_bar.dart';
import '../widgets/subject_tokens.dart';

class SubjectDetailsScreen extends GetView<SubjectController> {
  const SubjectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = controller.state.value;
    final subject = Get.arguments as SubjectItem?;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: SubjectTokens.pageBg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: ListView(
              children: [
                SubjectHeader(
                  title: subject?.title ?? 'الكيمياء',
                  subtitle:
                      'شرح تفصيلي لأبواب المنهج من المعادلات الكيميائية وحتى الكيمياء العضوية.',
                  onBack: () => Get.back(),
                ),
                const SizedBox(height: 12),
                const SubjectSearchBar(
                  hintText: 'ابحث عن عنوان درس او محاضرة...',
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: SubjectTokens.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: SubjectTokens.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'كورسات الكيمياء المتاحة',
                        style: TextStyle(
                          color: SubjectTokens.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'شرح تفصيلي لأبواب المنهج من المعادلات الكيميائية وحتى الكيمياء العضوية.',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: SubjectTokens.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: state.courses
                            .map(
                              (course) => Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: course == state.courses.last ? 0 : 8,
                                  ),
                                  child: SubjectCourseCard(item: course),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: SubjectQuickCard(
                        icon: Icons.folder_outlined,
                        iconColor: Colors.red,
                        title: 'ملزم الشرح PDF',
                        subtitle: 'حمل ملخصات ومراجعات الباب الآن',
                        footer: 'تم رفع: 10 ملفات من الآن',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SubjectQuickCard(
                        icon: Icons.access_time_rounded,
                        iconColor: const Color(0xFF6B7280),
                        title: 'اختباراتي السابقة',
                        subtitle: 'تابع نتائج اختباراتك السابقة',
                        footer: 'عدد اختباراتك السابقة: 3 اختبارات',
                        onTap: controller.openTests,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                const SubjectExamPreviewCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
