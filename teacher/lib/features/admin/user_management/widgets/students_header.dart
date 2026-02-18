import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentsHeader extends StatelessWidget {
  const StudentsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 6),
        Row(
          children: [
            InkWell(
              onTap: () => Get.back(),
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
          "إدارة حسابات الطلاب",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 6),
        const Text(
          "متابعة والتحكم في حسابات الطلاب المسجلين داخل التطبيق",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }
}
