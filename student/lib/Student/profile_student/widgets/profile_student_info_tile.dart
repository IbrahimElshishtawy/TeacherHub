import 'package:flutter/material.dart';
import 'package:teacher/features/Student/profile_student/state/profile_student_state.dart';

class ProfileStudentInfoTile extends StatelessWidget {
  const ProfileStudentInfoTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            const SizedBox(width: 12),
            const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 18,
              color: ProfileStudentTheme.primary,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ProfileStudentTheme.textDark,
                ),
              ),
            ),
            Icon(
              icon,
              size: 22,
              color: ProfileStudentTheme.iconBlue,
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}