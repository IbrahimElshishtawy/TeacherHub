import 'package:flutter/material.dart';

class WarningCardHeader extends StatelessWidget {
  const WarningCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'التنبيهات',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF2D3A55),
              ),
            ),
            const Text(
              'تابع كل التنبيهات المتعلقة بحسابك  في التطبيق ',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w200,
                color: Color(0xFF2D3A55),
              ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.warning_amber_rounded,
          color: Color(0xFFFFC107),
          size: 30,
        ),
      ],
    );
  }
}
