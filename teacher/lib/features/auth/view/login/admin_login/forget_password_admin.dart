import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher/features/auth/view/login/widget.forget/btn_contact.dart';
import 'package:teacher/features/auth/view/login/widget.forget/header_body.dart';
import 'package:teacher/features/auth/view/login/widget.login/AppBar_Tap.dart';

class ForgotPasswordadminScreen extends StatelessWidget {
  const ForgotPasswordadminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarTap(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            /// ===== header ====
            HeaderBody(text: "تواصل معنا بسهولة لتغيير كلمة المرور"),

            const SizedBox(height: 50),

            /// ===== LOTTIE =====
            Lottie.asset('assets/lottie/Forgot Password.json', height: 280),

            const SizedBox(height: 50),

            /// ===== النص التوضيحي =====
            const Text(
              "يرجى الرجوع إلى فريق التطوير لإستعادة\nأو تغيير كلمة المرور الخاصة بك.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),

            const SizedBox(height: 40),

            /// ===== أزرار التواصل =====
            BtnContact(),
          ],
        ),
      ),
    );
  }
}
