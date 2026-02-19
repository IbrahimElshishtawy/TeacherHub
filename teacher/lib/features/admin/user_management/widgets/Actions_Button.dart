import 'package:flutter/material.dart';
import 'package:teacher/features/admin/user_management/widgets/students_table_section.dart';

class ActionsButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ActionsButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.more_horiz_rounded, size: 20),
        label: const Text(
          "الإجراءات",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 13,
            letterSpacing: 0.2,
          ),
        ),
        style:
            OutlinedButton.styleFrom(
              foregroundColor: StudentsTable.primaryBlue,
              side: BorderSide(color: StudentsTable.borderColor, width: 1.5),
              backgroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ).copyWith(
              overlayColor: WidgetStateProperty.all(
                StudentsTable.primaryBlue.withValues(alpha: 0.08),
              ),
            ),
      ),
    );
  }
}
