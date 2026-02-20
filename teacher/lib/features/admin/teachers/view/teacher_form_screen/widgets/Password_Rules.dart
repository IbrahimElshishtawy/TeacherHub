// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PasswordRules extends StatelessWidget {
  const PasswordRules({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'كلمة المرور يجب أن تحتوي على:\n'
      '- 8 أحرف على الأقل\n'
      '- حرف كبير واحد على الأقل\n'
      '- رقم واحد على الأقل\n'
      '- رمز خاص مسموح: @!#\$%^&*\n'
      '- لا تستخدم رموز محظورة: | / < >',
      textDirection: TextDirection.rtl,
      style: TextStyle(
        color: Colors.white70,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        height: 1.6,
      ),
    );
  }
}
