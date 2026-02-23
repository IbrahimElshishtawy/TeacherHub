// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  // Common
  final String? title;
  final IconData? icon;
  final Color color;

  // Optional content modes
  final String? value; // للـ Main cards
  final String? subtitle; // للـ Main cards (عرض الكل)

  final String? count; // للتسجيل/المستويات (xxx طالب)
  final String? percent; // للدرجات (88%)
  final String? note; // للدرجات (الأداء جيد...)

  final double cardHeight; // ✅ هنثبت الارتفاع فقط
  final double cardWidth;
  final VoidCallback? onSubtitleTap;
  final bool hideSubtitleWhenEmpty;

  const StatCard({
    super.key,
    this.title,
    this.icon,
    this.color = Colors.blue,
    this.value,
    this.subtitle,
    this.count,
    this.percent,
    this.note,
    this.cardWidth = 84,
    this.cardHeight = 139,
    this.onSubtitleTap,

    this.hideSubtitleWhenEmpty = true,
  });

  @override
  Widget build(BuildContext context) {
    final String sub = (subtitle ?? '').trim();
    final bool hasSubtitle = sub.isNotEmpty;

    return SizedBox(
      height: cardHeight,
      width: cardWidth,
      child: Card(
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 1),
              if (icon != null) Icon(icon, color: color, size: 37),
              const SizedBox(height: 1),
              Text(
                title ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),

              // ✅ 1) درجات
              if ((percent ?? '').trim().isNotEmpty) ...[
                Text(
                  percent!.trim(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  (note ?? '').trim(),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ]
              // ✅ 2) عدّاد (مستويات/تسجيل)
              else if ((count ?? '').trim().isNotEmpty) ...[
                const Text(
                  "عدد الطلاب",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 1),
                Text(
                  count!.trim(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: color,
                  ),
                ),
              ]
              // ✅ 3) Main value
              else if ((value ?? '').trim().isNotEmpty) ...[
                Text(
                  value!.trim(),
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],

              const SizedBox(height: 2),

              // ✅ Subtitle (اختياري)
              if (!(hideSubtitleWhenEmpty && !hasSubtitle))
                _Subtitle(subtitle: sub, color: color, onTap: onSubtitleTap),

              const SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  final String subtitle;
  final Color color;
  final VoidCallback? onTap;

  const _Subtitle({
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool clickable = onTap != null;

    final textWidget = Text(
      subtitle,
      style: TextStyle(
        fontSize: 10,
        fontWeight: clickable ? FontWeight.w800 : FontWeight.w700,
        color: clickable ? color : Colors.black.withOpacity(0.6),
        decoration: clickable ? TextDecoration.underline : null,
      ),
      textAlign: TextAlign.center,
    );

    if (!clickable) return textWidget;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: textWidget,
      ),
    );
  }
}
