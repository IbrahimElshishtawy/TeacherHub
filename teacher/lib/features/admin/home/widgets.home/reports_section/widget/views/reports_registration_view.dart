import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:teacher/features/admin/home/widgets.home/reports_section/widget/widget/reports_State_Card.dart';
import 'package:teacher/features/admin/home/widgets.home/reports_section/widget/widget/reports_back_button.dart';

class ReportsRegistrationView extends StatelessWidget {
  final VoidCallback onBack;

  const ReportsRegistrationView({super.key, required this.onBack});

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
                count: "532 طالب",
                color: Colors.blue,
                cardHeight: 150,
              ),
            ),
            SizedBox(width: 1),
            Expanded(
              child: StatCard(
                title: "رياضيات",
                icon: Symbols.calculate,
                count: "633 طالب",
                color: Colors.orange,
                cardHeight: 150,
              ),
            ),
            SizedBox(width: 1),
            Expanded(
              child: StatCard(
                title: "كيمياء",
                icon: Symbols.science,
                count: "780 طالب",
                color: Colors.purple,
                cardHeight: 150,
              ),
            ),
            SizedBox(width: 1),
            Expanded(
              child: StatCard(
                title: "فيزياء",
                icon: Symbols.hub,
                count: "980 طالب",
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
