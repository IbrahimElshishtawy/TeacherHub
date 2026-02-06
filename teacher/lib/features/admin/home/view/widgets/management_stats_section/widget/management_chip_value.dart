import 'package:flutter/material.dart';

class ManagementChipValue extends StatelessWidget {
  const ManagementChipValue({
    super.key,
    required this.value,
    required this.color,
    this.width = 72,
    this.height = 26,
  });

  final int value;
  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
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
  }
}
