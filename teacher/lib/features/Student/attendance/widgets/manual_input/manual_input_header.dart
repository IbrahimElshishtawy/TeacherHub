import 'package:flutter/material.dart';

import 'manual_input_theme.dart';

class ManualInputHeader extends StatelessWidget {
  const ManualInputHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [ManualInputTheme.primary, ManualInputTheme.primary2],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.fingerprint_rounded,
            color: Colors.white,
            size: 22,
          ),
        ),
        const SizedBox(width: 14),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'إدخال يدوي',
              style: TextStyle(
                color: ManualInputTheme.titleColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
              ),
            ),
            Text(
              'أدخل الرقم التعريفي مباشرةً',
              style: TextStyle(
                color: ManualInputTheme.subtitleColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
