import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color color;
  final IconData icon;
  final double cardWidth; // إضافة عرض الكارد
  final double cardHeight; // إضافة ارتفاع الكارد

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
    required this.icon,
    this.cardWidth = 85, // القيمة الافتراضية هي 150.0
    this.cardHeight = 150, // القيمة الافتراضية هي 160.0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth, // تحديد العرض
      height: cardHeight, // تحديد الارتفاع
      margin: const EdgeInsets.symmetric(
        vertical: 1,
      ), // تقليل الفارق بين الكاردات
      child: Card(
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(6), // تقليل الـ padding داخل الكارد
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 4),
              Icon(
                icon,
                color: color,
                size: 37, // حجم الأيقونة
              ),
              const SizedBox(height: 4),
              Text(
                title, // عنوان الكارد
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value, // عرض القيمة
                style: TextStyle(
                  fontSize: 9, // حجم النص
                  fontWeight: FontWeight.w800,
                  color: color, // لون النص
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle, // التوضيح تحت العنوان
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }
}
