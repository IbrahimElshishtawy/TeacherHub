import 'package:flutter/material.dart';

class WarningList extends StatelessWidget {
  const WarningList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _WarningItem(
          title: 'إدخال كلمة المرور بشكل متكرر',
          description:
              'تم تسجيل عدة محاولات فاشلة لتسجيل الدخول. الرجاء التأكد من بياناتك.',
          color: Colors.red,
        ),
        _WarningItem(
          title: 'محاولة أخذ لقطة شاشة أثناء الاختبار',
          description:
              'تم الكشف عن محاولة غير مسموح بها لأخذ لقطة شاشة خلال الاختبار.',
          color: Colors.orange,
        ),
      ],
    );
  }
}

class _WarningItem extends StatelessWidget {
  const _WarningItem({
    required this.title,
    required this.description,
    required this.color,
  });

  final String title;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 30,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF7B8598),
                    fontWeight: FontWeight.w500,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'التفاصيل',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2F6FED),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
