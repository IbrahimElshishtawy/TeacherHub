import 'package:flutter/material.dart';

class ReportsHeader extends StatelessWidget {
  final VoidCallback onBack;
  const ReportsHeader({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: onBack,
              borderRadius: BorderRadius.circular(12),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 28,
                  color: Colors.red,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 6),
        const Text(
          "معاينة التقارير",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        const Text(
          "نظرة سريعة على أهم مؤشرات الأداء داخل النظام",
          style: TextStyle(fontSize: 13, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
