import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        const Expanded(
          child: Column(
            children: [
              Text(
                "الإعدادات العامة",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                "تحكم في حسابك، وتفضيلات التطبيق بما يناسب احتياجاتك.",
                style: TextStyle(fontSize: 12, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(width: 34),
      ],
    );
  }
}
