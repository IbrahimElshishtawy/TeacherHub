import 'dart:math' as math;
import 'package:flutter/material.dart';

class ManagementBarValue extends StatelessWidget {
  const ManagementBarValue({
    super.key,
    required this.value,
    required this.color,
    required this.ratio,
    this.minWidth = 110,
    this.height = 26,
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
        final maxW = c.maxWidth;
        final w = math.max(minWidth, maxW * ratio);

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
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
