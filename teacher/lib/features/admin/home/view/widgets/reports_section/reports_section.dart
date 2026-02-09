import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/home/controller/Reports_Statistics_Controller.dart';
import 'package:teacher/features/admin/home/view/widgets/reports_section/widget/views/reports_grades_view.dart';
import 'package:teacher/features/admin/home/view/widgets/reports_section/widget/views/reports_levels_view.dart';
import 'package:teacher/features/admin/home/view/widgets/reports_section/widget/views/reports_main_view.dart';
import 'package:teacher/features/admin/home/view/widgets/reports_section/widget/views/reports_registration_view.dart';

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
                switch (c.view.value) {
                  case ReportsView.main:
                    return ReportsMainView(controller: c);
                  case ReportsView.levels:
                    return ReportsLevelsView(onBack: c.backToMain);
                  case ReportsView.registration:
                    return ReportsRegistrationView(onBack: c.backToMain);
                  case ReportsView.grades:
                    return ReportsGradesView(onBack: c.backToMain);
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
