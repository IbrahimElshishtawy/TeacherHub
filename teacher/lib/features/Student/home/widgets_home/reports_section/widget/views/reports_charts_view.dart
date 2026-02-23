import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/home/controller/Reports_Statistics_Controller.dart';
import 'package:teacher/features/admin/home/widgets_home/reports_section/widget/widget/chart/reports_pie_chart.dart';
import 'package:teacher/features/admin/home/widgets_home/reports_section/widget/widget/chart/reports_chart_menu.dart';
import 'package:teacher/features/admin/home/widgets_home/reports_section/widget/widget/chart/reports_chart_data.dart';

class ReportsChartsView extends StatelessWidget {
  final ReportsStatisticsController controller;
  final VoidCallback onBack;

  const ReportsChartsView({
    super.key,
    required this.controller,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    const double menuWidth = 95;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: menuWidth,
          child: ReportsChartMenu(controller: controller),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Obx(() {
              final type = controller.chartType.value;
              final data = ReportsChartData.data(type);
              final title = ReportsChartData.title(type);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: SizedBox(
                      width: 125,
                      height: 125,
                      child: ReportsPieChart(data: data, showValues: true),
                    ),
                  ),

                  const SizedBox(height: 40),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      ),

                      const SizedBox(width: 2),

                      SizedBox(
                        width: 80,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: onBack,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            "عرض القيم",
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
