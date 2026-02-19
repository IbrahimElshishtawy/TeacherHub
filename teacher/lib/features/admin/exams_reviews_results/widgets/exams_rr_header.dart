import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamsRRHeader extends StatelessWidget {
  const ExamsRRHeader({super.key});

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
          "الاختبارات والمراجعات",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 6),
        const Text(
          "إدارة الاختبارات، المراجعات، ونتائج الطلاب في مكان واحد",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const SizedBox(height: 14),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            "القسم الذي تريد إدارته",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(height: 6),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            "يمكنك من هنا إدارة الاختبارات، المراجعات، ومتابعة نتائج الطلاب بسهولة.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}
