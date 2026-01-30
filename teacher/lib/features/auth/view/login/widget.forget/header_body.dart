import 'package:flutter/material.dart';

class HeaderBody extends StatelessWidget {
  final String text;
  const HeaderBody({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 30),
      child: Column(
        children: [
          const Text(
            "نسيت كلمة المرور؟",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            textDirection: TextDirection.rtl,
          ),

          const SizedBox(height: 8),

          Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.grey),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
