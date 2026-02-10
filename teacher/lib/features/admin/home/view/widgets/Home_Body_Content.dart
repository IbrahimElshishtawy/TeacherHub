import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/view/widgets/Payment_Status_Section/Payment_Status_Section.dart';
import 'package:teacher/features/admin/home/view/widgets/management_stats_section/management_stats_section.dart';
import 'package:teacher/features/admin/home/view/widgets/performance_reports/performance_reports_card.dart';
import 'package:teacher/features/admin/home/view/widgets/quick_actions_section/quick_actions_section.dart';
import 'package:teacher/features/admin/home/view/widgets/reports_section/reports_section.dart';

class HomeBodyContent extends StatelessWidget {
  const HomeBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ManagementStatsSection(),
          SizedBox(height: 8),
          QuickActionsSection(),
          SizedBox(height: 8),
          PaymentStatusSection(),
          SizedBox(height: 8),
          ReportsStatisticsSection(),
          SizedBox(height: 8),
          PerformanceReportsCard(),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
