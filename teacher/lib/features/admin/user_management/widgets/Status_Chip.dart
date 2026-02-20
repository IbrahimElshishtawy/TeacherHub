// ignore_for_file: file_names

import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  final bool isActive;
  const StatusChip({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final config = _getStatusConfig();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [config.bgColor, config.bgColor.withValues(alpha: 0.7)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: config.fgColor.withValues(alpha: 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: config.fgColor.withValues(alpha: 0.15),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: config.fgColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            config.text,
            style: TextStyle(
              color: config.fgColor,
              fontWeight: FontWeight.w900,
              fontSize: 12.5,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }

  _StatusConfig _getStatusConfig() {
    if (isActive) {
      return const _StatusConfig(
        text: "نشط",
        bgColor: Color(0xFFE9F8F0),
        fgColor: Color(0xFF19B66A),
      );
    }
    return const _StatusConfig(
      text: "موقوف",
      bgColor: Color(0xFFFFEBEE),
      fgColor: Color(0xFFE53935),
    );
  }
}

class _StatusConfig {
  final String text;
  final Color bgColor;
  final Color fgColor;

  const _StatusConfig({
    required this.text,
    required this.bgColor,
    required this.fgColor,
  });
}
