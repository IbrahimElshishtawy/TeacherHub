import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/courses_controller.dart';

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
                padding: EdgeInsets.all(6),
                child: Icon(Icons.arrow_back_ios_new_rounded, size: 23),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () => Get.find<CoursesController>().createNewCourseDialog(),
              icon: const Icon(Icons.add_rounded, size: 18),
              label: const Text(
                "إنشاء كورس جديد",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2F6BFF),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        const Text(
          "إدارة الكورسات",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 2),
        const Text(
          "عرض جميع الكورسات الخارجية وتعديل حالتها أو معاينتها",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.5, color: Colors.black54),
        ),
      ],
    );
  }
}
