import 'dart:math' as math;
import 'package:flutter/material.dart';

class ManagementChipValue extends StatelessWidget {
  const ManagementChipValue({
    super.key,
    required this.value,
    required this.color,
    required this.ratio,
    this.minWidth = 32,
    this.height = 17,
  });

  final int value;
  final Color color;
  final double ratio;
  final double minWidth;
  final double height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final w = math.max(minWidth, c.maxWidth * ratio);

        return Container(
          width: w,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(999),
          ),
          alignment: Alignment.center,
          child: Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
