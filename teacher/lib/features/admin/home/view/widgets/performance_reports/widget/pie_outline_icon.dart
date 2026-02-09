import 'dart:math';
import 'package:flutter/material.dart';

class PieOutlineIcon extends StatelessWidget {
  final double size;
  final double strokeWidth;

  const PieOutlineIcon({super.key, this.size = 64, this.strokeWidth = 3});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _PieOutlinePainter(strokeWidth: strokeWidth),
    );
  }
}

class _PieOutlinePainter extends CustomPainter {
  final double strokeWidth;

  _PieOutlinePainter({required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (min(size.width, size.height) / 2) * 0.88;

    const green = Color(0xFF7CFF00);
    const red = Color(0xFFFF3B30);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter
      ..isAntiAlias = true;
    final sep1 = -pi / 2;
    final wedgeSweep = pi * 0.33;
    final sep2 = sep1 - wedgeSweep;

    final mainRect = Rect.fromCircle(center: center, radius: radius);
    paint.color = green;
    canvas.drawArc(mainRect, sep1, (2 * pi) - wedgeSweep, false, paint);
    canvas.drawLine(
      center,
      center + Offset(cos(sep1), sin(sep1)) * radius,
      paint,
    );
    canvas.drawLine(
      center,
      center + Offset(cos(sep2), sin(sep2)) * radius,
      paint,
    );

    final mid = (sep1 + sep2) / 2;
    final pullOut = radius * 0.30;
    final redCenter = center + Offset(cos(mid), sin(mid)) * pullOut;
    final redRect = Rect.fromCircle(center: redCenter, radius: radius);
    paint.color = red;
    canvas.drawArc(redRect, sep2, wedgeSweep, false, paint);
    canvas.drawLine(
      redCenter,
      redCenter + Offset(cos(sep1), sin(sep1)) * radius,
      paint,
    );
    canvas.drawLine(
      redCenter,
      redCenter + Offset(cos(sep2), sin(sep2)) * radius,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _PieOutlinePainter oldDelegate) {
    return oldDelegate.strokeWidth != strokeWidth;
  }
}
