import 'package:flutter/material.dart';

class ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconColor;

  const ActionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = backgroundColor ?? Colors.white;
    final br = borderColor ?? const Color.fromARGB(147, 232, 238, 245);

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(2),
        child: Container(
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(4), // تقليل الزوايا قليلاً
            border: Border.all(color: br),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D000000),
                blurRadius: 6, // تقليل التشويش
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 2,
          ), // تقليل padding
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // وضع النص في المنتصف عموديًا
            crossAxisAlignment:
                CrossAxisAlignment.center, // وضع النص في المنتصف أفقيًا
            children: [
              Icon(
                icon,
                color: iconColor ?? const Color(0xFF2F6FED),
                size: 40, // تقليل حجم الأيقونة
              ),
              const SizedBox(height: 6), // فاصل بين الأيقونة والنص
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1E2A3B),
                ),
              ),
              const SizedBox(
                height: 4,
              ), // تقليل المسافة بين العنوان والنص الفرعي
              Center(
                child: Text(
                  subtitle,
                  maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    height: 2.4,
                    color: const Color(0xFF6B7C93),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
