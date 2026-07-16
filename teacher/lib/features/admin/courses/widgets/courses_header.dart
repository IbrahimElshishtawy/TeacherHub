import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/courses_controller.dart';

class CoursesHeader extends StatelessWidget {
  const CoursesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoursesController>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "إدارة المحتوى التعليمي",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.black),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "إدارة جميع الفيديوهات والكورسات والمراجعات والاختبارات.",
                      style: TextStyle(fontSize: 12.5, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => Get.offAllNamed('/home_admin'),
                icon: const Icon(Icons.arrow_forward_ios, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () => controller.openContentForm(),
                icon: const Icon(Icons.add, size: 18),
                label: const Text("إضافة محتوى", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton.icon(
                onPressed: () => controller.assignVideoListToBatch(),
                icon: const Icon(Icons.share, size: 18),
                label: const Text("إسناد دفعة", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF7C3AED),
                  side: const BorderSide(color: Color(0xFF7C3AED)),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
