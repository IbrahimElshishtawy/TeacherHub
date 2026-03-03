// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class TestSectionHeader extends StatelessWidget {
  const TestSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الاختبارات المتاحة',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            shadows: [
              Shadow(
                blurRadius: 2,
                color: Colors.black.withOpacity(0.5),
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
        SizedBox(height: 2),
        Text(
          'ادخل الاختبار في الوقت المحدد واحرص على الالتزام بالتعليمات',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
            height: 1.3,
            fontWeight: FontWeight.w400,
          ),
        ),
        Divider(),
      ],
    );
  }
}
