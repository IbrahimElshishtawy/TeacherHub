// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/view/widgets/reports_section/widget/widget/reports_State_Card.dart';
import 'package:teacher/features/admin/home/view/widgets/reports_section/widget/widget/reports_back_button.dart';

class ReportsRegistrationView extends StatelessWidget {
  final VoidCallback onBack;

  const ReportsRegistrationView({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            StatCard(title: "عربي", count: "532 طالب", color: Colors.blue),
            StatCard(title: "رياضيات", count: "633 طالب", color: Colors.orange),
            StatCard(title: "كيمياء", count: "780 طالب", color: Colors.purple),
            StatCard(title: "فيزياء", count: "980 طالب", color: Colors.green),
          ],
        ),
        const SizedBox(height: 14),
        ReportsBackButton(onBack: onBack),
      ],
    );
  }
}
