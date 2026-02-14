import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/view/teacher_account_screen.dart'; // تأكد من مسار الملف

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String email;
  final String password;

  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => TeacherAccountScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2F6FED),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: const Text(
          'الرجوع للرئيسية',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
