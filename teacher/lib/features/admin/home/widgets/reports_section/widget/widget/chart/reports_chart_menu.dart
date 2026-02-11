import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/home/controller/Reports_Statistics_Controller.dart';

class ReportsChartMenu extends StatelessWidget {
  final ReportsStatisticsController controller;

  const ReportsChartMenu({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Obx(() {
        final selected = controller.chartType.value;

        Widget item(String text, ChartType type) {
          final isSelected = selected == type;
          return InkWell(
            onTap: () => controller.setChart(type),
            child: Container(
              height: 52,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.black12),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            item("الحضور", ChartType.attendance),
            item("الدرجات", ChartType.grades),
            item("التسجيل", ChartType.registration),
            item("المستويات", ChartType.levels),
          ],
        );
      }),
    );
  }
}
