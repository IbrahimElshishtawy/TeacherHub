import 'package:flutter/material.dart';

class OverviewProgressBar extends StatelessWidget {
  const OverviewProgressBar({super.key, required this.value});
  final double value;

  @override
  Widget build(BuildContext context) {
    final v = value.clamp(0.0, 1.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: SizedBox(
        height: 10,
        child: Stack(
          children: [
            Container(color: const Color(0xFFE2E6EF)),
            FractionallySizedBox(
              widthFactor: v,
              child: Container(color: const Color(0xFF2F6FED)),
            ),
          ],
        ),
      ),
    );
  }
}
