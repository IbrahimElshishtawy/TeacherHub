import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/home/controller/Reports_Statistics_Controller.dart';

import 'package:teacher/features/admin/home/widgets_home/reports_section/widget/views/reports_charts_view.dart';
import 'package:teacher/features/admin/home/widgets_home/reports_section/widget/views/reports_grades_view.dart';
import 'package:teacher/features/admin/home/widgets_home/reports_section/widget/views/reports_levels_view.dart';
import 'package:teacher/features/admin/home/widgets_home/reports_section/widget/views/reports_main_view.dart';
import 'package:teacher/features/admin/home/widgets_home/reports_section/widget/views/reports_registration_view.dart';

class ReportsStatisticsSection extends StatelessWidget {
  const ReportsStatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ReportsStatisticsController());

    return Padding(
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "التقارير والإحصائيات",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Obx(() {
                final v = c.view.value;

                Widget child;
                switch (v) {
                  case ReportsView.main:
                    child = const ReportsMainView();
                    break;

                  case ReportsView.levels:
                    child = ReportsLevelsView(onBack: c.backToMain);
                    break;

                  case ReportsView.registration:
                    child = ReportsRegistrationView(onBack: c.backToMain);
                    break;

                  case ReportsView.grades:
                    child = ReportsGradesView(onBack: c.backToMain);
                    break;

                  case ReportsView.charts:
                    child = ReportsChartsView(
                      controller: c,
                      onBack: c.backToMain,
                    );
                    break;
                }

                return KeyedSubtree(key: ValueKey(v), child: child);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
