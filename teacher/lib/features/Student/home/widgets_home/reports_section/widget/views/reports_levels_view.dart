import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/widgets_home/reports_section/widget/widget/reports_State_Card.dart';
import 'package:teacher/features/admin/home/widgets_home/reports_section/widget/widget/reports_back_button.dart';

class ReportsLevelsView extends StatelessWidget {
  final VoidCallback onBack;

  const ReportsLevelsView({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: StatCard(
                title: "3 اعدادي",
                icon: Icons.groups,
                count: "320 طالب",
                color: Colors.blue,
                cardHeight: 150,
              ),
            ),
            SizedBox(width: 1),
            Expanded(
              child: StatCard(
                title: "1 ثانوي",
                icon: Icons.groups,
                count: "250 طالب",
                color: Colors.orange,
                cardHeight: 150,
              ),
            ),
            SizedBox(width: 1),
            Expanded(
              child: StatCard(
                title: "2 ثانوي",
                icon: Icons.groups,
                count: "459 طالب",
                color: Colors.purple,
                cardHeight: 150,
              ),
            ),
            SizedBox(width: 1),
            Expanded(
              child: StatCard(
                title: "3 ثانوي",
                icon: Icons.groups,
                count: "600 طالب",
                color: Colors.green,
                cardHeight: 150,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        ReportsBackButton(onBack: onBack),
      ],
    );
  }
}
