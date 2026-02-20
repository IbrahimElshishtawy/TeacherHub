// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/teachers/controller/teacher_form_controller.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/widgets/InfoRow.dart';
import 'package:teacher/features/admin/teachers/view/teacher_form_screen/widgets/NavRow.dart';

class LoginCard extends StatelessWidget {
  final TeacherFormController form;
  final VoidCallback onTapEditNameEmail;
  final VoidCallback onTapEditPassword;

  const LoginCard({
    super.key,
    required this.form,
    required this.onTapEditNameEmail,
    required this.onTapEditPassword,
  });

  static const _titleColor = Color(0xFF1E2A3B);
  static const _subColor = Color(0xFF6B7C93);
  static const _cardBorder = Color(0xFFE8EEF5);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _cardBorder,
        ), // Updated to use local constants
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          const Text(
            'بيانات تسجيل الدخول',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: _titleColor, // Updated to use local constants
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'تحكم في كلمة مرور الحساب وإجراءات تأمين تسجيل الدخول',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w700,
              color: _subColor, // Updated to use local constants
              height: 1.6,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(height: 1),

          // Use the NavRow widget for editing name/email and password
          NavRow(
            icon: Icons.person_outline,
            title: 'تغيير الاسم و البريد الإلكتروني',
            onTap: onTapEditNameEmail,
          ),
          const Divider(height: 1),

          NavRow(
            icon: Icons.lock_outline,
            title: 'تغيير كلمة المرور',
            onTap: onTapEditPassword,
          ),
          const Divider(height: 1),

          Obx(() {
            final createdAt = form.teacher.value?.createdAt ?? '—';
            return InfoRow(
              icon: Icons.calendar_today_outlined,
              title: 'تاريخ إنشاء الحساب:  $createdAt',
            );
          }),

          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F8FC),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: _cardBorder,
                ), // Updated to use local constants
              ),
              child: const Text(
                'ننصح بتغيير كلمة المرور بشكل دوري وتفعيل 2FA للحماية',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w700,
                  color: _subColor, // Updated to use local constants
                  height: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
