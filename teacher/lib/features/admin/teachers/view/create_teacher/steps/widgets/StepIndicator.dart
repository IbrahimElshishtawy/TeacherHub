// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int stepNumber;
  final String stepTitle;
  final bool isActive;
  final bool isCompleted;

  const StepIndicator({
    super.key,
    required this.stepNumber,
    required this.stepTitle,
    required this.isActive,
    required this.isCompleted,
  });

  Color get _mainColor {
    if (isCompleted) return Colors.green; // Green for completed step
    if (isActive) {
      return const Color.fromARGB(255, 2, 159, 244); // Blue for active step
    }
    return const Color.fromARGB(255, 10, 4, 4); // Grey for inactive step
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Circle for the step
            CircleAvatar(
              radius: 20,
              backgroundColor: _mainColor,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: isCompleted
                    ? const Icon(
                        Icons.check,
                        key: ValueKey('check'),
                        color: Colors.white,
                        size: 22,
                      )
                    : Text(
                        '$stepNumber',
                        key: ValueKey('num-$stepNumber'),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
              ),
            ),
            // Positioned triangle below the circle
            Positioned(
              bottom: -9,
              left: 13,
              child: CustomPaint(
                size: const Size(15, 8),
                painter: TrianglePainter(color: _mainColor),
              ),
            ),
          ],
        ),
        const SizedBox(height: 9),

        // Rectangle with rounded corners for the step title
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          decoration: BoxDecoration(
            color: _mainColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isCompleted || isActive
                  ? _mainColor
                  : const Color(0xFFBDBDBD),
              width: 1,
            ),
          ),
          child: Text(
            stepTitle,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..moveTo(0, 0) // Start point
      ..lineTo(size.width / 2, size.height) // Bottom center
      ..lineTo(size.width, 0) // Right point
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant TrianglePainter oldDelegate) =>
      oldDelegate.color != color;
}
