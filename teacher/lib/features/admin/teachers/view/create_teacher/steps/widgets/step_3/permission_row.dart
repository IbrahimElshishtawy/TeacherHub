import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/step_3/permissions_colors.dart';

class PermissionRow extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const PermissionRow({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Align the text to the end
        children: [
          Transform.scale(
            scale: 0.85,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: PermColors.primary,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: PermColors.titleColor,
            ),
          ),
        ],
      ),
    );
  }
}
