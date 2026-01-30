import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher/features/auth/view/login/widget.forget/header_body.dart';
import 'package:teacher/features/auth/view/login/widget.login/AppBar_Tap.dart';

class ForgetPasswordTeacher extends StatelessWidget {
  const ForgetPasswordTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarTap(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            /// ===== header ====
            HeaderBody(
              text: 'يرجى مراجعة الأدمن المسؤول عنك لتغيير كلمة المرور',
            ),

            const SizedBox(height: 50),

            /// ===== LOTTIE =====
            Lottie.asset('assets/lottie/Forgot Password.json', height: 280),

            const SizedBox(height: 50),

            /// ===== النص التوضيحي =====
            const Text(
              " لإستعادة أو تغيير كلمة المرور الخاصة بك\n يرجى الرجوع إلى الأدمن المسؤول عنك",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
