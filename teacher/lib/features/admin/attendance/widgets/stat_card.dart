import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String valueText;
  final Color valueColor;
  final IconData icon;
  final Color iconColor;
  final String buttonText;
  final VoidCallback onTap;

  const StatCard({
    super.key,
    required this.title,
    required this.valueText,
    required this.valueColor,
    required this.icon,
    required this.iconColor,
    required this.buttonText,
    required this.onTap,
  });

  static const Color primaryBlue = Color(0xFF2F6BFF);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6E8F0)),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 26),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
          const SizedBox(height: 6),
          Text(
            valueText,
            style: TextStyle(fontWeight: FontWeight.w900, color: valueColor),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 34,
            child: OutlinedButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                foregroundColor: primaryBlue,
                side: const BorderSide(color: Color(0xFFE6E8F0)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
