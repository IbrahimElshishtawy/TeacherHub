import 'package:flutter/material.dart';

class TextBodyLogin extends StatelessWidget {
  const TextBodyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // النص الأول
          Padding(
            padding: const EdgeInsetsGeometry.only(top: 0, left: 100, right: 0),
            child: Column(
              children: [
                const Text(
                  "استخدم البريد الإلكتروني وكلمة المرور \n المرسل إليك من المطور",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 8),
                // النص الثاني
                const Text(
                  "يرجى ملء البيانات لتسجيل الدخول :",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
