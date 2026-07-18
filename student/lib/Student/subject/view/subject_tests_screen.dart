import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/subject_controller.dart';
import '../widgets/subject_header.dart';
import '../widgets/subject_search_bar.dart';
import '../widgets/subject_test_record_card.dart';
import '../widgets/subject_tokens.dart';

class SubjectTestsScreen extends GetView<SubjectController> {
  const SubjectTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = controller.state.value;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: SubjectTokens.pageBg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              children: [
                SubjectHeader(
                  title: 'سجل الاختبارات',
                  subtitle: 'تابع نتائج اختباراتك السابقة وراجع أخطاءك لتطوير مستواك',
                  onBack: () => Get.back(),
                ),
                const SizedBox(height: 14),
                const SubjectSearchBar(
                  hintText: 'ابحث عن عنوان الاختبار أو الكود...',
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.testRecords.length,
                    itemBuilder: (_, index) {
                      return SubjectTestRecordCard(
                        item: state.testRecords[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
