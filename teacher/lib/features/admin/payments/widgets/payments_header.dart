import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentsHeader extends StatelessWidget {
  const PaymentsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          const SizedBox(height: 6),
          Row(
            children: [
              InkWell(
                onTap: () => Get.back(),
                borderRadius: BorderRadius.circular(12),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 18,
                    color: Colors.red,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            "متابعة المدفوعات",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 6),
          const Text(
            "هنا يمكنك متابعة جميع المدفوعات الخاصة بالمستخدمين ومراجعة التفاصيل",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
