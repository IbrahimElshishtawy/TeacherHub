// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  static const _titleColor = Color(0xFF1E2A3B);
  static const _subColor = Color(0xFF6B7C93);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 6),
        Text(
          'تعديل بيانات المدرس',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: _titleColor, // Corrected reference here
          ),
        ),
        SizedBox(height: 6),
        Text(
          'قم بتحديث الاسم والبريد وكلمة المرور للمدرس من هنا',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: _subColor, // Corrected reference here
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
