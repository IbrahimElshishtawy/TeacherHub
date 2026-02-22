import 'package:flutter/material.dart';
import '../state/reports_state.dart';

class MonthTabs extends StatelessWidget {
  final ReportMonth selected;
  final ValueChanged<ReportMonth> onChanged;

  const MonthTabs({super.key, required this.selected, required this.onChanged});

  static const Color primaryBlue = Color(0xFF2F6BFF);

  @override
  Widget build(BuildContext context) {
    final months = ReportMonth.values;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: months.map((m) {
          final isSel = m == selected;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () => onChanged(m),
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSel ? primaryBlue : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSel ? primaryBlue : const Color(0xFFE6E8F0),
                  ),
                ),
                child: Text(
                  m.label,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: isSel ? Colors.white : const Color(0xFF1E2A3B),
                    fontSize: 12.5,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
