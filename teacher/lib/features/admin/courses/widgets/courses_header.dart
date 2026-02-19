import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesHeader extends StatelessWidget {
  const CoursesHeader({super.key});

  static const Color bg = Color(0xFFF6F7FB);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 6),
        Row(
          children: [
            InkWell(
              onTap: () => Get.offAllNamed('/home_admin'),
              borderRadius: BorderRadius.circular(12),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.arrow_back_ios_new_rounded, size: 18),
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 6),
        const Text(
          "إدارة الكورسات",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 6),
        const Text(
          "عرض جميع الكورسات الخارجية وتعديل حالتها أو معاينتها",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.5, color: Colors.black54),
        ),
      ],
    );
  }
}
