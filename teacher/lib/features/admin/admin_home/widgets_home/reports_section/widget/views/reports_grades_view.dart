import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:teacher/features/admin/admin_home/widgets_home/reports_section/widget/widget/reports_State_Card.dart';
import 'package:teacher/features/admin/admin_home/widgets_home/reports_section/widget/widget/reports_back_button.dart';

class ReportsGradesView extends StatelessWidget {
  final VoidCallback onBack;

  const ReportsGradesView({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: StatCard(
                title: "عربي",
                icon: Symbols.menu_book,
                color: Colors.blue,
                percent: "88%",
                note: "الأداء جيد جدًا",
                cardHeight: 150,
              ),
            ),
            SizedBox(width: 1),
            Expanded(
              child: StatCard(
                title: "رياضيات",
                icon: Symbols.calculate,
                color: Colors.orange,
                percent: "62%",
                note: "الأداء ضعيف\nيرجى المتابعة",
                cardHeight: 150,
              ),
            ),
            SizedBox(width: 1),
            Expanded(
              child: StatCard(
                title: "كيمياء",
                icon: Symbols.science,
                color: Colors.purple,
                percent: "74%",
                note: "الأداء متوسط",
                cardHeight: 150,
              ),
            ),
            SizedBox(width: 1),
            Expanded(
              child: StatCard(
                title: "فيزياء",
                icon: Symbols.hub,
                color: Colors.green,
                percent: "80%",
                note: "الأداء جيد",
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
