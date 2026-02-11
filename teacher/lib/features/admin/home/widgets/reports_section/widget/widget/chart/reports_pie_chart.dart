import 'dart:math';
import 'package:flutter/material.dart';
import 'package:teacher/features/admin/home/widgets/reports_section/widget/widget/chart/reports_chart_data.dart';

class ReportsPieChart extends StatelessWidget {
  final List<PieItem> data;
  final bool showValues;
  final double chartSize;

  const ReportsPieChart({
    super.key,
    required this.data,
    required this.showValues,
    this.chartSize = 102,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(chartSize, chartSize),
      painter: _PiePainter(data: data, showValues: showValues),
    );
  }
}

class _PiePainter extends CustomPainter {
  final List<PieItem> data;
  final bool showValues;

  _PiePainter({required this.data, required this.showValues});

  @override
  void paint(Canvas canvas, Size size) {
    final total = data.fold<double>(0, (s, e) => s + e.value);
    final rect = Rect.fromLTWH(4, 4, size.width - 8, size.height - 8);
    final center = rect.center;
    final radius = rect.width / 2;

    double start = -pi / 2;

    final textPainter = TextPainter(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );

    for (final item in data) {
      final sweep = (item.value / total) * 2 * pi;

      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = item.color;

      canvas.drawArc(rect, start, sweep, true, paint);

      final mid = start + sweep / 2;

      final p1 = Offset(
        center.dx + cos(mid) * (radius * 0.88),
        center.dy + sin(mid) * (radius * 0.88),
      );

      final p2 = Offset(
        center.dx + cos(mid) * (radius * 1.10),
        center.dy + sin(mid) * (radius * 1.10),
      );
      final bool rightSide = cos(mid) >= 0;
      final double hLen = 12;
      final p3 = Offset(p2.dx + (rightSide ? hLen : -hLen), p2.dy);

      final linePaint = Paint()
        ..color = item.color
        ..strokeWidth = 1.6
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(p1, p2, linePaint);
      canvas.drawLine(p2, p3, linePaint);

      // النص
      final label = showValues
          ? "${item.label}\n${(item.value / total * 100).toStringAsFixed(0)}%"
          : item.label;

      textPainter.text = TextSpan(
        text: label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: item.color,
        ),
      );
      textPainter.layout(maxWidth: 70);

      final offset = Offset(
        rightSide ? (p3.dx + 4) : (p3.dx - 4 - textPainter.width),
        p3.dy - textPainter.height / 2,
      );

      textPainter.paint(canvas, offset);

      start += sweep;
    }
  }

  @override
  bool shouldRepaint(covariant _PiePainter oldDelegate) {
    return oldDelegate.data != data || oldDelegate.showValues != showValues;
  }
}
