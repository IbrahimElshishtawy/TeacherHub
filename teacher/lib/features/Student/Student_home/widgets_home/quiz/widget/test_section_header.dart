import 'package:flutter/material.dart';

class TestSectionHeader extends StatelessWidget {
  const TestSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // العنوان الرئيسي
        Text(
          'الاختبارات المتاحة',
          style: TextStyle(
            fontSize: 24, // حجم أكبر للعناوين
            fontWeight: FontWeight.bold,
            color: Colors.black87, // لون العنوان
            shadows: [
              Shadow(
                blurRadius: 2,
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 2),
              ),
            ], // إضافة تأثير الظل للعناوين
          ),
        ),
        SizedBox(height: 12), // مسافة بين العنوان والوصف
        // الوصف الفرعي
        Text(
          'ادخل الاختبار في الوقت المحدد واحرص على الالتزام بالتعليمات',
          style: TextStyle(
            fontSize: 16, // زيادة حجم النص
            color: Colors.grey[700], // لون النص الفرعي
            height: 1.5, // زيادة المسافة بين الأسطر لتحسين القراءة
            fontWeight: FontWeight.w400, // زيادة الوزن للخط لزيادة وضوحه
          ),
        ),
        const SizedBox(height: 20), // مسافة إضافية أسفل الـ Header
      ],
    );
  }
}
