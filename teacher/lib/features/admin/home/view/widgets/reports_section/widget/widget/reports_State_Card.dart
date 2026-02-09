// ignore_for_file: deprecated_member_use

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

  final double cardWidth;
  final double cardHeight;

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

    this.cardWidth = 90,
    this.cardHeight = 150,
    this.onSubtitleTap,
    this.hideSubtitleWhenEmpty = true,
  });

  @override
  Widget build(BuildContext context) {
    final String sub = (subtitle ?? '').trim();
    final bool hasSubtitle = sub.isNotEmpty;

    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 4),
              Icon(icon, color: color, size: 37),
              const SizedBox(height: 4),
              Text(
                title!,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),

              // ✅ 1) لو percent موجود => ده كارت درجات
              if ((percent ?? '').trim().isNotEmpty) ...[
                Text(
                  percent!.trim(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: color,
                  ),
                ),
                const SizedBox(height: 8),
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
              // ✅ 2) لو count موجود => ده كارت تسجيل/مستويات
              else if ((count ?? '').trim().isNotEmpty) ...[
                const Text(
                  "عدد الطلاب",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  count!.trim(),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    color: color,
                  ),
                ),
              ]
              // ✅ 3) غير كده => كارت Main (value)
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

              const SizedBox(height: 8),

              // ✅ Subtitle (اختياري)
              if (!(hideSubtitleWhenEmpty && !hasSubtitle))
                _Subtitle(subtitle: sub, color: color, onTap: onSubtitleTap),

              const SizedBox(height: 6),
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
