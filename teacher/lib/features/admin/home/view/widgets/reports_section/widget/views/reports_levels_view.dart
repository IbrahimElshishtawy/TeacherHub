// TODO Implement this library.
import 'package:flutter/material.dart';

import 'package:teacher/features/admin/home/view/widgets/reports_section/widget/widget/reports_State_Card.dart';
import 'package:teacher/features/admin/home/view/widgets/reports_section/widget/widget/reports_back_button.dart';

class ReportsLevelsView extends StatelessWidget {
  final VoidCallback onBack;

  const ReportsLevelsView({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            StatCard(title: "3 اعدادي", count: "320 طالب", color: Colors.blue),
            StatCard(title: "1 ثانوي", count: "250 طالب", color: Colors.orange),
            StatCard(title: "2 ثانوي", count: "459 طالب", color: Colors.purple),
            StatCard(title: "3 ثانوي", count: "600 طالب", color: Colors.green),
          ],
        ),
        const SizedBox(height: 14),
        ReportsBackButton(onBack: onBack),
      ],
    );
  }
}
