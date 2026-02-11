import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:teacher/features/admin/home/controller/Reports_Statistics_Controller.dart';
import 'package:teacher/features/admin/home/widgets_home/reports_section/widget/widget/reports_State_Card.dart';

class ReportsMainView extends GetView<ReportsStatisticsController> {
  const ReportsMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: 'مستويات',
                value: 'عدد الطلاب \nحسب السنة',
                subtitle: 'عرض الكل',
                color: Colors.orange,
                icon: Symbols.timeline,
                onSubtitleTap: controller.showLevels,
                cardHeight: 150,
              ),
            ),
            const SizedBox(width: 1),
            Expanded(
              child: StatCard(
                title: 'التسجيل',
                value: '600 طالب',
                subtitle: 'عرض كل المواد',
                color: Colors.green,
                icon: Symbols.school,
                onSubtitleTap: controller.showRegistration,
                cardHeight: 150,
              ),
            ),
            const SizedBox(width: 1),
            Expanded(
              child: StatCard(
                title: 'الدرجات',
                value: '82%',
                subtitle: 'عرض كل المواد',
                color: Colors.purple,
                icon: Symbols.grading,
                onSubtitleTap: controller.showGrades,
                cardHeight: 150,
              ),
            ),
            const SizedBox(width: 1),
            Expanded(
              child: StatCard(
                title: 'الحضور',
                value: '930/1000',
                subtitle: '70 طالب غائب',
                color: Colors.blue,
                icon: Symbols.calendar_month,

                cardHeight: 150,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: controller.showCharts,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text(
              'عرض كرسم بياني',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ),
      ],
    );
  }
}
