import 'package:flutter/material.dart';
import '../state/attendance_state.dart';

class GradeTabs extends StatelessWidget {
  final AttendanceGradeTab current;
  final ValueChanged<AttendanceGradeTab> onSelect;

  const GradeTabs({super.key, required this.current, required this.onSelect});

  static const Color primaryBlue = Color(0xFF2F6BFF);

  @override
  Widget build(BuildContext context) {
    Widget tab(String text, AttendanceGradeTab v) {
      final selected = current == v;
      return Expanded(
        child: InkWell(
          onTap: () => onSelect(v),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selected ? primaryBlue : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE6E8F0)),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: selected ? Colors.white : const Color(0xFF1E2A3B),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        tab('"3" إعدادي', AttendanceGradeTab.prep3),
        const SizedBox(width: 8),
        tab('"1" ثانوي', AttendanceGradeTab.sec1),
        const SizedBox(width: 8),
        tab('"2" ثانوي', AttendanceGradeTab.sec2),
      ],
    );
  }
}
