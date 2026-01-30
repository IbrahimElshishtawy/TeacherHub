import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher/features/auth/view/login/widget.login/AppBar_Tap.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarTap(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            /// ===== العنوان =====
            const Text(
              "نسيت كلمة المرور؟",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              textDirection: TextDirection.rtl,
            ),

            const SizedBox(height: 8),

            const Text(
              "تواصل معنا بسهولة لتغيير كلمة المرور",
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            /// ===== LOTTIE =====
            Lottie.asset('assets/lottie/Forgot Password.json', height: 220),

            const SizedBox(height: 30),

            /// ===== النص التوضيحي =====
            const Text(
              "يرجى الرجوع إلى فريق التطوير لإستعادة\nأو تغيير كلمة المرور الخاصة بك.",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),

            const SizedBox(height: 25),

            /// ===== أزرار التواصل =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _contactButton(
                  text: "تواصل معنا عبر Facebook",
                  icon: Icons.facebook,
                  color: Colors.blue,
                  onTap: () {},
                ),
                _contactButton(
                  text: "تواصل معنا عبر WhatsApp",
                  icon: Icons.chat,
                  color: Colors.green,
                  onTap: () {},
                ),
              ],
            ),

            const Spacer(),

            /// ===== Footer =====
            const Text(
              "© 2025 YourAppName",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  /// ===== زر تواصل =====
  static Widget _contactButton({
    required String text,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 6),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 13,
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
