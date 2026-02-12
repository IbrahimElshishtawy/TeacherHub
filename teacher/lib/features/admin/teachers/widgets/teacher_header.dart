import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TeacherHeader extends StatelessWidget {
  final bool isActive;
  final String fullName;
  final String email;
  final String stageLabel;
  final String createdAtLabel;
  final String avatarUrl;

  const TeacherHeader({
    super.key,
    required this.isActive,
    required this.fullName,
    required this.email,
    required this.stageLabel,
    required this.createdAtLabel,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 155,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: const Color(0xFFE8EEF5)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Status and Full Name + Email
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Status dot + label
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xFF2ECC71)
                        : const Color(0xFFB0B7C3),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  isActive ? 'نشط' : 'غير نشط',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF7A8699),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), // Spacing between sections
            // Email and Stage Label
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      fullName,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: const Color.fromARGB(255, 7, 9, 11),
                      ),
                    ),
                    Text(
                      email,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF5B6B80),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      stageLabel,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF6B7C93),
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      createdAtLabel,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF6B7C93),
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 15),
                // Avatar, CreatedAtLabel
                avatarUrl.isNotEmpty
                    ? CircleAvatar(
                        radius: 45,
                        backgroundColor: const Color(0xFFEAF2FF),
                        backgroundImage: NetworkImage(avatarUrl),
                      )
                    : Lottie.asset(
                        'assets/lottie/Teacher.json', // الملف الخاص بالرسوم المتحركة
                        width: 90,
                        height: 90,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
