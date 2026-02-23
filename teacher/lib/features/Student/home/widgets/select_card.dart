// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // استيراد مكتبة Lottie

class SelectCard extends StatelessWidget {
  final String titleEn;
  final String subtitleAr;
  final String assetPath;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectCard({
    super.key,
    required this.titleEn,
    required this.subtitleAr,
    required this.assetPath,
    required this.isSelected,
    required this.onTap,
  });

  static const Color primaryBlue = Color(0xFF2F6BFF);

  @override
  Widget build(BuildContext context) {
    final bgColor = isSelected ? primaryBlue : Colors.white;
    final titleColor = isSelected ? Colors.white : Colors.black87;
    final subColor = isSelected ? Colors.white70 : Colors.black45;
    final borderColor = isSelected
        ? Colors.transparent
        : const Color(0xFFE6E8EF);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Row(
          children: [
            // عرض الرسوم المتحركة بدلاً من الصورة الثابتة
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withOpacity(0.15)
                    : const Color(0xFFEFF3FF),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Lottie.asset(
                  assetPath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titleEn,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 22, // تكبير الحجم
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitleAr,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: subColor,
                      fontSize: 12, // تكبير الحجم
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
