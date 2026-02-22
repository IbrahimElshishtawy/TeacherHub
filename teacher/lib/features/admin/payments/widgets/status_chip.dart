// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../state/payments_state.dart';

class StatusChip extends StatelessWidget {
  final PaymentStatus status;
  const StatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    late final String text;
    late final Color bg;
    late final Color fg;

    switch (status) {
      case PaymentStatus.paid:
        text = "تم الدفع";
        bg = const Color(0xFFE9F8F0);
        fg = const Color(0xFF19B66A);
        break;
      case PaymentStatus.pending:
        text = "معلق";
        bg = const Color(0xFFFFF3E0);
        fg = const Color(0xFFFF9800);
        break;
      case PaymentStatus.failed:
        text = "مرفوض";
        bg = const Color(0xFFFFEBEE);
        fg = const Color(0xFFE53935);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: fg.withOpacity(0.25)),
      ),
      child: Text(
        text,
        style: TextStyle(color: fg, fontWeight: FontWeight.w900, fontSize: 12),
      ),
    );
  }
}
