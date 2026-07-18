import 'package:flutter/material.dart';

class StepHeader extends StatelessWidget {
  final int currentStep;
  final List<String> labels;

  const StepHeader({
    super.key,
    required this.currentStep,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF1E2D7D);
    final greyBorder = Colors.grey.shade300;

    const stepsWidth = 260.0;
    const circleSize = 39.0;
    const pillWidth = 140.0;

    const triangleW = 14.0;
    const triangleH = 10.0;

    Widget circle(int idx) {
      final isActive = idx == currentStep;
      return Container(
        width: circleSize,
        height: circleSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? primary : Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: isActive ? primary : greyBorder,
            width: 1.5,
          ),
        ),
        child: Text(
          "${idx + 1}",
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black54,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final leftGroup = (constraints.maxWidth - stepsWidth) / 2;

        // ✅ مراكز الدواير الفعلية داخل الجروب (مع spaceBetween)
        final centersInGroup = <double>[
          circleSize / 2, // circle 1 center
          stepsWidth / 2, // circle 2 center
          stepsWidth - (circleSize / 2), // circle 3 center
        ];

        final activeCenterX = leftGroup + centersInGroup[currentStep];

        final pillLeft = (activeCenterX - (pillWidth / 2)).clamp(
          0.0,
          constraints.maxWidth - pillWidth,
        );

        final triangleLeft = (activeCenterX - (triangleW / 2)).clamp(
          0.0,
          constraints.maxWidth - triangleW,
        );

        return Column(
          children: [
            const SizedBox(height: 4),
            Center(
              child: SizedBox(
                width: stepsWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [circle(0), circle(1), circle(2)],
                ),
              ),
            ),
            SizedBox(
              height: 52,
              width: double.infinity,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                    left: triangleLeft,
                    top: 1,
                    child: CustomPaint(
                      size: const Size(triangleW, triangleH),
                      painter: _TrianglePainter(primary),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                    left: pillLeft,
                    top: 12,
                    child: SizedBox(
                      width: pillWidth,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Text(
                          labels[currentStep],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;
  _TrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, size.height)
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _TrianglePainter oldDelegate) =>
      oldDelegate.color != color;
}
