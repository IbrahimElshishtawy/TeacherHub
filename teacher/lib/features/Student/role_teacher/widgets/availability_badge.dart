// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AvailabilityBadge extends StatelessWidget {
  final bool available;
  const AvailabilityBadge({super.key, required this.available});

  @override
  Widget build(BuildContext context) {
    final bg = available
        ? const Color(0xFF27AE60).withOpacity(.12)
        : const Color(0xFFEB5757).withOpacity(.12);

    final fg = available ? const Color(0xFF27AE60) : const Color(0xFFEB5757);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: fg.withOpacity(.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: fg, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            available ? "متاح" : "غير متاح",
            style: TextStyle(
              color: fg,
              fontWeight: FontWeight.w800,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
