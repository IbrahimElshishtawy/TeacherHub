import 'package:flutter/material.dart';

class TestSectionHeader extends StatelessWidget {
  const TestSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الاختبارـات المتاحة',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'ادخل الاختبار في الوقت المحدد واحرص على الالتزام بالتعليمات',
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
