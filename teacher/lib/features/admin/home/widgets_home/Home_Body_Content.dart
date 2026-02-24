// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/widgets_home/Payment_Status_Section/Payment_Status_Section.dart';
import 'package:teacher/features/admin/home/widgets_home/calender/calender_card_widgets.dart';
import 'package:teacher/features/admin/home/widgets_home/management_stats_section/management_stats_section.dart';
import 'package:teacher/features/admin/home/widgets_home/quick_actions_section/quick_actions_section.dart';
import 'package:teacher/features/admin/home/widgets_home/reports_section/reports_section.dart';

class HomeBodyContent extends StatelessWidget {
  const HomeBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
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
          //   PerformanceReportsCard(),
          EventsCalendarCard(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
