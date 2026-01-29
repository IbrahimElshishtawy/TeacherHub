import 'package:flutter/material.dart';

class LeftArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint arrowPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Path arrowPath = Path()
      ..moveTo(size.width * -0.10, size.height * 0.5)
      ..lineTo(size.width * 0.4, size.height * 0.8)
      ..moveTo(size.width * 0.4, size.height * 0.2)
      ..lineTo(size.width * -0.10, size.height * 0.5);
    canvas.drawPath(arrowPath, arrowPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
