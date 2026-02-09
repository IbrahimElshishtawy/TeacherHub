// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/drawer/view/widgets/admin_drawer.dart';
import 'package:teacher/features/admin/home/view/widgets/AppBar_widget/home_app_bar.dart';
import 'package:teacher/features/admin/home/view/widgets/management_stats_section/management_stats_section.dart';
import 'package:teacher/features/admin/home/view/widgets/Payment_Status_Section/Payment_Status_Section.dart';
import 'package:teacher/features/admin/home/view/widgets/performance_reports/performance_reports_card.dart';
import 'package:teacher/features/admin/home/view/widgets/quick_actions_section/quick_actions_section.dart';
import 'package:teacher/features/admin/home/view/widgets/reports_section/reports_section.dart';

import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F7F9),

        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: GetBuilder<HomeController>(
            id: 'drawer',
            builder: (c) {
              final t = c.drawerAnim.value.clamp(0.0, 1.0);

              return HomeAppBarWidget(onMenuTap: c.openDrawer, hideT: t);
            },
          ),
        ),

        body: GetBuilder<HomeController>(
          id: 'drawer',
          builder: (c) {
            final t = c.drawerAnim.value; // 0..1

            final width = MediaQuery.of(context).size.width;
            final shiftX = -width * 0.50 * t; // تتحرك لليسار
            final shiftY = 35.0 * t;
            final scale = 1 - (0.25 * t);
            final radius = 20.0 * t;

            return Stack(
              children: [
                // الخلفية (الدرو)
                AdminDrawer(onClose: c.closeDrawer),

                // Overlay (اضغط برا يقفل)
                if (t > 0)
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: c.closeDrawer,
                      child: Container(
                        color: Colors.black.withOpacity(0.12 * t),
                      ),
                    ),
                  ),

                Transform.translate(
                  offset: Offset(shiftX, shiftY),
                  child: Transform.scale(
                    scale: scale,
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(radius),
                      child: Container(
                        color: const Color(0xFFF6F7F9),
                        child: _HomeBodyContent(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _HomeBodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ManagementStatsSection(),
          const SizedBox(height: 8),
          QuickActionsSection(),
          const SizedBox(height: 8),
          PaymentStatusSection(),
          const SizedBox(height: 8),
          ReportsStatisticsSection(),
          const SizedBox(height: 8),
          PerformanceReportsCard(),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
