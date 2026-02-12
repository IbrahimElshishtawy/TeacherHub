import 'package:flutter/material.dart';

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

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE8EEF5)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          // Status dot + label
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
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
              const SizedBox(height: 10),

              Text(
                fullName,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1E2A3B),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                email,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF5B6B80),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                stageLabel,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF6B7C93),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                createdAtLabel,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF6B7C93),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Avatar
          CircleAvatar(
            radius: 28,
            backgroundColor: const Color(0xFFEAF2FF),
            backgroundImage: (avatarUrl.isNotEmpty)
                ? NetworkImage(avatarUrl)
                : null,
            child: avatarUrl.isEmpty
                ? const Icon(Icons.person, color: Color(0xFF2F6FED), size: 28)
                : null,
          ),
        ],
      ),
    );
  }
}
