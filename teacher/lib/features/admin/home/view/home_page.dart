import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/home/controller/home_controller.dart';
import 'package:teacher/features/admin/home/view/widgets/AppBar_widget/home_app_bar.dart';
import 'package:teacher/features/admin/home/view/widgets/drawer/animated_admin_drawer_scaffold.dart';
import 'package:teacher/features/admin/home/view/widgets/management_stats_section/management_stats_section.dart';
import 'package:teacher/features/admin/home/view/widgets/Payment_Status_Section/Payment_Status_Section.dart';
import 'package:teacher/features/admin/home/view/widgets/performance_reports/performance_reports_card.dart';
import 'package:teacher/features/admin/home/view/widgets/quick_actions_section/quick_actions_section.dart';
import 'package:teacher/features/admin/home/view/widgets/reports_section/reports_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();

    return AnimatedAdminDrawerScaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: GetBuilder<HomeController>(
          id: 'drawer',
          builder: (_) {
            final t = c.t.clamp(0.0, 1.0);
            return HomeAppBarWidget(
              onMenuTap: c.toggleDrawer, // ✅ فتح/غلق
              hideT: t,
            );
          },
        ),
      ),
      body: const _HomeBodyContent(),
    );
  }
}

class _HomeBodyContent extends StatelessWidget {
  const _HomeBodyContent();

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
