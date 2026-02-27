import 'package:flutter/material.dart';

class StepHeader extends StatelessWidget {
  final int currentStep; // 0..2
  final List<String> labels;

  const StepHeader({
    super.key,
    required this.currentStep,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF1E2D7D); // قريب من اللي بالصورة
    final grey = Colors.grey.shade300;

    Widget circle(int idx) {
      final active = idx <= currentStep;
      return Container(
        width: 34,
        height: 34,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? primary : Colors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: active ? primary : grey, width: 1.5),
        ),
        child: Text(
          "${idx + 1}",
          style: TextStyle(
            color: active ? Colors.white : Colors.black54,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
    }

    Widget line(bool active) => Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        color: active ? primary : grey,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        Row(
          children: [
            circle(0),
            line(currentStep >= 1),
            circle(1),
            line(currentStep >= 2),
            circle(2),
          ],
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              labels[currentStep],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
