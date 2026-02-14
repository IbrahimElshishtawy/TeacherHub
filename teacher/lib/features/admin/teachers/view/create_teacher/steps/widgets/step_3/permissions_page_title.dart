import 'package:flutter/material.dart';
import 'permissions_colors.dart';

class PermissionsPageTitle extends StatelessWidget {
  const PermissionsPageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: PermColors.cardBorder),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: const [
          Text(
            'الصلاحيات والأذونات',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: PermColors.titleColor,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'تحديد ما يمكن للمدرس فعله داخل النظام',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: PermColors.subColor,
            ),
          ),
        ],
      ),
    );
  }
}
