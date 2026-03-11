import 'dart:math' as math;

import 'package:flutter/material.dart';

class QuizResultGauge extends StatelessWidget {
  final double percentage;

  const QuizResultGauge({
    super.key,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    final double safePercentage = percentage.clamp(0, 100);

    return SizedBox(
      width: 220,
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(220, 160),
            painter: _QuizGaugePainter(percentage: safePercentage),
          ),
          Positioned(
            bottom: 14,
            child: Column(
              children: [
                const Text(
                  'النتيجة',
                  style: TextStyle(
                    color: Color(0xFF74788C),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  safePercentage.toStringAsFixed(0),
                  style: const TextStyle(
                    color: Color(0xFF35384A),
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
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

class _QuizGaugePainter extends CustomPainter {
  final double percentage;

  const _QuizGaugePainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height - 8);
    final double radius = math.min(size.width / 2.3, size.height - 22);
    const double startAngle = math.pi;
    const double sweepAngle = math.pi;

    final Paint baseArc = Paint()
      ..color = const Color(0xFFE2E5F2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    final Paint fillArc = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFA19BFF), Color(0xFF7C73F6)],
      ).createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      baseArc,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle * (percentage / 100),
      false,
      fillArc,
    );

    final Paint tickPaint = Paint()
      ..color = const Color(0xFF474B57)
      ..strokeWidth = 1.2;

    final Paint minorTickPaint = Paint()
      ..color = const Color(0xFF8C91A2)
      ..strokeWidth = 0.8;

    for (int i = 0; i <= 100; i += 2) {
      final double angle = startAngle + (i / 100) * sweepAngle;
      final bool isMajor = i % 10 == 0;
      final double tickStart = radius - (isMajor ? 14 : 8);
      final double tickEnd = radius - 1;

      final Offset p1 = Offset(
        center.dx + tickStart * math.cos(angle),
        center.dy + tickStart * math.sin(angle),
      );
      final Offset p2 = Offset(
        center.dx + tickEnd * math.cos(angle),
        center.dy + tickEnd * math.sin(angle),
      );
      canvas.drawLine(p1, p2, isMajor ? tickPaint : minorTickPaint);

      if (isMajor) {
        final TextPainter tp = TextPainter(
          text: TextSpan(
            text: '$i',
            style: const TextStyle(
              color: Color(0xFF35384A),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();

        final double labelRadius = radius - 28;
        final Offset labelOffset = Offset(
          center.dx + labelRadius * math.cos(angle) - (tp.width / 2),
          center.dy + labelRadius * math.sin(angle) - (tp.height / 2),
        );
        tp.paint(canvas, labelOffset);
      }
    }

    final Paint needlePaint = Paint()
      ..color = const Color(0xFF7C73F6)
      ..style = PaintingStyle.fill;

    final double needleAngle = startAngle + (percentage / 100) * sweepAngle;
    final double needleLength = radius - 22;

    final Path needle = Path()
      ..moveTo(
        center.dx + 5 * math.cos(needleAngle + math.pi / 2),
        center.dy + 5 * math.sin(needleAngle + math.pi / 2),
      )
      ..lineTo(
        center.dx + needleLength * math.cos(needleAngle),
        center.dy + needleLength * math.sin(needleAngle),
      )
      ..lineTo(
        center.dx + 5 * math.cos(needleAngle - math.pi / 2),
        center.dy + 5 * math.sin(needleAngle - math.pi / 2),
      )
      ..close();

    canvas.drawPath(needle, needlePaint);
    canvas.drawCircle(center, 6, needlePaint);
  }

  @override
  bool shouldRepaint(covariant _QuizGaugePainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}
