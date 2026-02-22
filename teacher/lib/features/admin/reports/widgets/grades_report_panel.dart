// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../state/reports_state.dart';
import 'month_tabs.dart';

class GradesReportPanel extends StatelessWidget {
  final ReportMonth month;
  final GradesMonthData data;
  final ValueChanged<ReportMonth> onMonthChange;

  const GradesReportPanel({
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

        _Line(
          color: const Color(0xFF19B66A),
          text: "إجمالي الطلاب: ${data.total} طالب",
          dot: "●",
        ),
        const SizedBox(height: 6),
        _Line(
          color: const Color(0xFFE53935),
          text:
              "متوسط الدرجات خلال هذا الشهر: ${data.avg.toStringAsFixed(0)}/100",
          dot: "●",
        ),
        const SizedBox(height: 6),
        _Line(
          color: const Color(0xFFE53935),
          text: "أقل درجة: 30/100 — أعلى درجة: 100/100",
          dot: "✖",
        ),
        const SizedBox(height: 10),

        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _ChipStat(
              label: "درجات عالية",
              value: data.high,
              color: const Color(0xFF19B66A),
            ),
            _ChipStat(
              label: "درجات متوسطة",
              value: data.mid,
              color: const Color(0xFFFF9800),
            ),
            _ChipStat(
              label: "درجات ضعيفة",
              value: data.low,
              color: const Color(0xFFE53935),
            ),
          ],
        ),
      ],
    );
  }
}

class _Line extends StatelessWidget {
  final Color color;
  final String text;
  final String dot;

  const _Line({required this.color, required this.text, required this.dot});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          dot,
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

class _ChipStat extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const _ChipStat({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Text(
        "$label: $value",
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w900,
          fontSize: 12,
        ),
      ),
    );
  }
}
