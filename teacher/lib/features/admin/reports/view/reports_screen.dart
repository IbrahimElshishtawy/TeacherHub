import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/reports_controller.dart';
import '../widgets/reports_header.dart';
import '../widgets/reports_section_card.dart';
import '../widgets/attendance_report_panel.dart';
import '../widgets/grades_report_panel.dart';

class ReportsScreen extends GetView<ReportsController> {
  const ReportsScreen({super.key});

  static const Color bg = Color(0xFFF6F7FB);

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
              children: [
                ReportsHeader(onBack: () => Get.back()),
                const SizedBox(height: 14),

                ReportsSectionCard(
                  title: "معدل الحضور والغياب",
                  subtitle: "نسبة الحضور والغياب للطلاب خلال الفترة المحددة",
                  expanded: st.attendanceExpanded,
                  onToggle: controller.toggleAttendanceExpanded,
                  child: AttendanceReportPanel(
                    month: st.attendanceMonth,
                    data: st.attendanceByMonth[st.attendanceMonth]!,
                    onMonthChange: controller.setAttendanceMonth,
                  ),
                ),

                const SizedBox(height: 14),

                ReportsSectionCard(
                  title: "متوسط درجات الطلاب",
                  subtitle:
                      "يوضح التوزيع العام لدرجات الطلاب خلال الفترة المحددة",
                  expanded: st.gradesExpanded,
                  onToggle: controller.toggleGradesExpanded,
                  child: GradesReportPanel(
                    month: st.gradesMonth,
                    data: st.gradesByMonth[st.gradesMonth]!,
                    onMonthChange: controller.setGradesMonth,
                  ),
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
