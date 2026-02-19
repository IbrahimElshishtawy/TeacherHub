import 'package:flutter/material.dart';

class AttendanceSummaryCard extends StatelessWidget {
  final int total;
  final int present;
  final int absent;
  final VoidCallback onPresentTap;
  final VoidCallback onAbsentTap;

  const AttendanceSummaryCard({
    super.key,
    required this.total,
    required this.present,
    required this.absent,
    required this.onPresentTap,
    required this.onAbsentTap,
  });

  static const Color primaryBlue = Color(0xFF1E2A7A);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE6E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // ===== Top Total Bar =====
          Container(
            height: 48,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: primaryBlue,
              borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
            ),
            child: Text(
              "عدد الطلاب الإجمالي : $total طالب",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 14,
              ),
            ),
          ),

          // ===== Present & Absent =====
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Expanded(
                  child: _MiniStat(
                    title: "عدد الطلاب الغائبة",
                    value: "$absent طالب",
                    valueColor: const Color(0xFFE53935),
                    icon: Icons.event_busy_outlined,
                    iconColor: const Color(0xFFE53935),
                    buttonText: "عرض قائمة الغياب",
                    onTap: onAbsentTap,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _MiniStat(
                    title: "عدد الطلاب الحاضرين",
                    value: "$present طالب",
                    valueColor: const Color(0xFF19B66A),
                    icon: Icons.event_available_outlined,
                    iconColor: const Color(0xFF19B66A),
                    buttonText: "عرض قائمة الحضور",
                    onTap: onPresentTap,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String title;
  final String value;
  final Color valueColor;
  final IconData icon;
  final Color iconColor;
  final String buttonText;
  final VoidCallback onTap;

  const _MiniStat({
    required this.title,
    required this.value,
    required this.valueColor,
    required this.icon,
    required this.iconColor,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7FB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 26),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: valueColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 32,
            child: OutlinedButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF2F6BFF),
                side: const BorderSide(color: Color(0xFFE6E8F0)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
