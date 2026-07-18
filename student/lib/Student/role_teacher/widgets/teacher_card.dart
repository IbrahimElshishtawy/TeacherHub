// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../state/subject_teacher_state.dart';
import 'availability_badge.dart';

class TeacherCard extends StatelessWidget {
  final TeacherModel teacher;
  final VoidCallback onTap;
  final bool isSelected;

  const TeacherCard({
    super.key,
    required this.teacher,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final bg = isSelected ? const Color(0xFF2F80ED) : Colors.white;
    final border = isSelected ? const Color(0xFF2F80ED) : Colors.transparent;

    final titleColor = isSelected ? Colors.white : Colors.black;
    final subColor = isSelected
        ? Colors.white.withOpacity(.90)
        : Colors.black54;
    final iconColor = isSelected
        ? Colors.white.withOpacity(.85)
        : Colors.black45;

    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: border, width: 1.4),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: isSelected
                        ? Colors.white.withOpacity(.18)
                        : const Color(0xFFF1F3F9),
                    backgroundImage: NetworkImage(teacher.avatarUrl),
                  ),

                  if (isSelected)
                    Positioned(
                      right: -2,
                      bottom: -2,
                      child: Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x22000000),
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 16,
                          color: Color(0xFF2F80ED),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "أ / ${teacher.name}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                              color: titleColor,
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: isSelected ? 0.95 : 1,
                          child: AvailabilityBadge(
                            available: teacher.available,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    _InfoRow(
                      icon: Icons.school_outlined,
                      text: "${teacher.gradeText} - ${teacher.stageText}",
                      iconColor: iconColor,
                      textColor: subColor,
                    ),
                    const SizedBox(height: 8),
                    _InfoRow(
                      icon: Icons.groups_2_outlined,
                      text:
                          "عدد الطلاب مع المدرس : ${teacher.studentsCount} طالب",
                      iconColor: iconColor,
                      textColor: isSelected
                          ? Colors.white.withOpacity(.95)
                          : const Color(0xFF2F80ED),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final Color? textColor;

  const _InfoRow({
    required this.icon,
    required this.text,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: iconColor ?? Colors.black45),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.black54,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}
