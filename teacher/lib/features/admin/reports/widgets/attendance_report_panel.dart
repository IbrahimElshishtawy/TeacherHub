import 'package:flutter/material.dart';
import '../state/reports_state.dart';
import 'month_tabs.dart';

class AttendanceReportPanel extends StatelessWidget {
  final ReportMonth month;
  final AttendanceMonthData data;
  final ValueChanged<ReportMonth> onMonthChange;

  const AttendanceReportPanel({
    super.key,
    required this.month,
    required this.data,
    required this.onMonthChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MonthTabs(selected: month, onChanged: onMonthChange),
        const SizedBox(height: 10),

        _Bullet(
          color: const Color(0xFF19B66A),
          text: "الحضور خلال هذا الشهر: ${data.present} من ${data.total} طالب",
          trailing: "✅",
        ),
        const SizedBox(height: 6),
        _Bullet(
          color: const Color(0xFF19B66A),
          text: "نسبة الحضور: ${data.presentRate.toStringAsFixed(0)}%",
          trailing: "●",
        ),
        const SizedBox(height: 10),

        _Bullet(
          color: const Color(0xFFE53935),
          text: "الغياب خلال هذا الشهر: ${data.absent} طالب",
          trailing: "❌",
        ),
        const SizedBox(height: 6),
        _Bullet(
          color: const Color(0xFFE53935),
          text: "نسبة الغياب: ${data.absentRate.toStringAsFixed(0)}%",
          trailing: "●",
        ),
      ],
    );
  }
}

class _Bullet extends StatelessWidget {
  final Color color;
  final String text;
  final String trailing;

  const _Bullet({
    required this.color,
    required this.text,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          trailing,
          style: TextStyle(color: color, fontWeight: FontWeight.w900),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w800,
              fontSize: 12.5,
            ),
          ),
        ),
      ],
    );
  }
}
