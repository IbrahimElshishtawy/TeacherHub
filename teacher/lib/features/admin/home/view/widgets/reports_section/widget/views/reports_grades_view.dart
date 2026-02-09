import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/view/widgets/reports_section/widget/widget/reports_State_Card.dart';
import 'package:teacher/features/admin/home/view/widgets/reports_section/widget/widget/reports_back_button.dart';

class ReportsGradesView extends StatelessWidget {
  final VoidCallback onBack;

  const ReportsGradesView({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            StatCard(
              title: "عربي",
              percent: "88%",
              note: "الأداء جيد جدًا",
              icon: Icons.menu_book,
              color: Colors.blue,
            ),
            StatCard(
              title: "رياضيات",
              percent: "62%",
              note: "الأداء ضعيف\nيرجى المتابعة",
              icon: Icons.calculate,
              color: Colors.orange,
            ),
            StatCard(
              title: "كيمياء",
              percent: "74%",
              note: "الأداء متوسط",
              icon: Icons.science,
              color: Colors.purple,
            ),
            StatCard(
              title: "فيزياء",
              percent: "80%",
              note: "الأداء جيد",
              icon: Icons.blur_circular,
              color: Colors.green,
            ),
          ],
        ),
        const SizedBox(height: 14),
        ReportsBackButton(onBack: onBack),
      ],
    );
  }
}
