import 'package:flutter/material.dart';

class SubjectTile extends StatelessWidget {
  final String subjectName;
  final IconData icon;
  final VoidCallback onTap;

  final String? selectedTeacherName;
  final String? selectedTeacherAvatar;

  const SubjectTile({
    super.key,
    required this.subjectName,
    required this.icon,
    required this.onTap,
    this.selectedTeacherName,
    this.selectedTeacherAvatar,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedTeacherName != null;

    return Material(
      color: isSelected ? const Color(0xFF2F80ED) : Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
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
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white.withOpacity(.15)
                      : const Color(0xFFF1F3F9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: isSelected ? Colors.white : Colors.black54,
                ),
              ),
              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      subjectName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                      ),
                    ),
                    if (isSelected) ...[
                      const SizedBox(height: 6),
                      Text(
                        selectedTeacherName!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withOpacity(.92),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              if (isSelected && selectedTeacherAvatar != null) ...[
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white.withOpacity(.25),
                  backgroundImage: NetworkImage(selectedTeacherAvatar!),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
