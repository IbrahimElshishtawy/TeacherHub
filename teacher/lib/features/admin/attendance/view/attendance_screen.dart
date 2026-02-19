import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/attendance/widgets/attendance_summary_card.dart';

import '../controller/attendance_controller.dart';

import '../widgets/attendance_header.dart';
import '../widgets/search_filter_row.dart';
import '../widgets/grade_tabs.dart';
import '../widgets/date_nav_bar.dart';

class AttendanceScreen extends GetView<AttendanceController> {
  const AttendanceScreen({super.key});

  static const Color bg = Color(0xFFF6F7FB);

  String _formatDate(DateTime d) {
    return "${d.year} / ${d.month} / ${d.day}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Obx(() {
            final st = controller.state.value;

            return ListView(
              children: <Widget>[
                const AttendanceHeader(),
                const SizedBox(height: 12),

                SearchFilterRow(
                  onChanged: controller.setQuery,
                  onFilter: controller.openFilter,
                ),
                const SizedBox(height: 12),

                GradeTabs(current: st.tab, onSelect: controller.setTab),
                const SizedBox(height: 12),

                DateNavBar(
                  dateText: _formatDate(st.date),
                  onPrev: controller.prevDay,
                  onNext: controller.nextDay,
                ),
                const SizedBox(height: 12),

                AttendanceSummaryCard(
                  total: st.totalStudents,
                  present: st.presentCount,
                  absent: st.absentCount,
                  onPresentTap: controller.openPresentList,
                  onAbsentTap: controller.openAbsentList,
                ),

                const SizedBox(height: 18),
              ],
            );
          }),
        ),
      ),
    );
  }
}
