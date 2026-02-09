// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/controller/Reports_Statistics_Controller.dart';
import 'package:teacher/features/admin/home/view/widgets/reports_section/widget/widget/reports_State_Card.dart';

class ReportsMainView extends StatelessWidget {
  final ReportsStatisticsController controller;

  const ReportsMainView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StatCard(
              title: 'مستويات',
              value: 'عدد الطلاب \nحسب السنة',
              subtitle: 'عرض الكل',
              color: Colors.orange,
              icon: Icons.timeline,
              onSubtitleTap: controller.showLevels,
            ),
            StatCard(
              title: 'التسجيل',
              value: '600 طالب',
              subtitle: 'عرض كل المواد',
              color: Colors.green,
              icon: Icons.school,
              onSubtitleTap: controller.showRegistration,
            ),
            StatCard(
              title: 'الدرجات',
              value: '82%',
              subtitle: 'عرض كل المواد',
              color: Colors.purple,
              icon: Icons.grade,
              onSubtitleTap: controller.showGrades,
            ),
            StatCard(
              title: 'الحضور',
              value: '930/1000',
              subtitle: '70 طالب غائب',
              color: Colors.blue,
              icon: Icons.calendar_today,
              onSubtitleTap: controller.showAttendance,
            ),
          ],
        ),
        const SizedBox(height: 6),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text(
              'عرض كرسم بياني',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ),
      ],
    );
  }
}
