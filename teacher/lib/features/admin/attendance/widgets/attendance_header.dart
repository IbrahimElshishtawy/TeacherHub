import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceHeader extends StatelessWidget {
  const AttendanceHeader({super.key});

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
                child: Icon(Icons.arrow_back_ios_new_rounded, size: 28),
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 6),
        const Text(
          "سجل الحضور والغياب العام",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 6),
        const Text(
          "الأرشيف المركزي لمتابعة إحصائيات حضور وغياب كافة الطلاب منذ بداية العام.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.5, color: Colors.black54),
        ),
      ],
    );
  }
}
