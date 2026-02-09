import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/view/widgets/reports_section/widget/widget/reports_back_button.dart';

class ReportsAttendanceView extends StatelessWidget {
  final VoidCallback onBack;

  const ReportsAttendanceView({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "تفاصيل الحضور (قريبًا)",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
        ),
        ReportsBackButton(onBack: onBack),
      ],
    );
  }
}
