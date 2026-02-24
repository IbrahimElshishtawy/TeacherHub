// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'day_cell.dart';

class CalendarGrid extends StatelessWidget {
  const CalendarGrid({
    super.key,
    required this.selectedDays,
    required this.yellowDays,
    required this.disabledDays,
  });

  final Set<int> selectedDays;
  final Set<int> yellowDays;
  final Set<int> disabledDays;

  static const Color _blue = Color(0xFF2F6BFF);
  static const Color _yellow = Color(0xFFF4B400);
  static const Color _gray = Color(0xFF5B667A);
  static const Color _muted = Color(0xFF8A93A3);

  @override
  Widget build(BuildContext context) {
    const week = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];

    final cells = <DayCell>[
      const DayCell(value: 23, faint: true),
      const DayCell(value: 24, faint: true),
      const DayCell(value: 25, faint: true),
      const DayCell(value: 26, faint: true),
      const DayCell(value: 27, faint: true),
      const DayCell(value: 28, faint: true),
      const DayCell(value: 1, isBlue: true),

      const DayCell(value: 2),
      const DayCell(value: 3),
      const DayCell(value: 4, isBlue: true),
      const DayCell(value: 5),
      const DayCell(value: 6),
      const DayCell(value: 7),
      const DayCell(value: 8, isBlue: true),

      const DayCell(value: 9),
      const DayCell(value: 10),
      const DayCell(value: 11, isBlue: true),
      const DayCell(value: 12),
      const DayCell(value: 13),
      const DayCell(value: 14),
      const DayCell(value: 15, isBlue: true),

      const DayCell(value: 16),
      const DayCell(value: 17),
      const DayCell(value: 18),
      const DayCell(value: 19),
      const DayCell(value: 20),
      const DayCell(value: 21),
      const DayCell(value: 22, isBlue: true),

      const DayCell(value: 23),
      const DayCell(value: 24, faint: true),
      const DayCell(value: 25, isBlue: true),
      const DayCell(value: 26, faint: true),
      const DayCell(value: 27, faint: true),
      const DayCell(value: 28, faint: true),
      const DayCell(value: 29, faint: true),

      const DayCell(value: 30, isYellow: true),
      const DayCell(value: 31),
      const DayCell(value: 1, faint: true),
      const DayCell(value: 2, faint: true),
      const DayCell(value: 3, faint: true),
      const DayCell(value: 4, faint: true),
      const DayCell(value: 5, faint: true),
    ];

    final mapped = cells.map((c) {
      final v = c.value;
      final isBlue = selectedDays.contains(v);
      final isYellow = yellowDays.contains(v);
      final isGray = disabledDays.contains(v);
      return c.copyWith(isBlue: isBlue, isYellow: isYellow, isGray: isGray);
    }).toList();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: week.map((w) {
            return SizedBox(
              width: 34,
              child: Text(
                w,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: _muted,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 6),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mapped.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.05,
          ),
          itemBuilder: (context, index) {
            final d = mapped[index];

            Color? bg;
            Color fg = const Color(0xFF1E2A3B);

            if (d.isBlue) {
              bg = _blue;
              fg = Colors.white;
            } else if (d.isYellow) {
              bg = _yellow;
              fg = const Color(0xFF1E2A3B);
            } else if (d.isGray) {
              bg = _gray.withOpacity(0.14);
              fg = _gray;
            } else if (d.faint) {
              fg = _muted;
            }

            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                "${d.value}",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: fg,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
