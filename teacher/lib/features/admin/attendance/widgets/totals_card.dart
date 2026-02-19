import 'package:flutter/material.dart';

class TotalsCard extends StatelessWidget {
  final int total;
  const TotalsCard({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF1E2A7A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "عدد الطلاب الإجمالي : $total طالب",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
