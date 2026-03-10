import 'package:flutter/material.dart';

import '../state/communication_channel_state.dart';
import 'communication_channel_tokens.dart';

class TeacherChannelCard extends StatelessWidget {
  final TeacherChannelItem teacher;
  final bool expanded;
  final VoidCallback onTap;
  final VoidCallback? onClose;

  const TeacherChannelCard({
    super.key,
    required this.teacher,
    required this.expanded,
    required this.onTap,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 260),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: expanded
            ? CommunicationChannelTokens.selectedBg
            : CommunicationChannelTokens.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: expanded
              ? CommunicationChannelTokens.accent.withOpacity(0.4)
              : CommunicationChannelTokens.border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(expanded ? 0.12 : 0.08),
            blurRadius: expanded ? 12 : 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Column(
            children: [
              Row(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _TeacherAvatar(teacher: teacher, radius: expanded ? 24 : 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          teacher.teacherName,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: CommunicationChannelTokens.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: CommunicationChannelTokens.chipBg,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                teacher.subjectName,
                                style: const TextStyle(
                                  color: CommunicationChannelTokens.accent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            if (!expanded)
                              Expanded(
                                child: Text(
                                  teacher.previewText,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    color: CommunicationChannelTokens.textSecondary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (expanded && onClose != null)
                    IconButton(
                      onPressed: onClose,
                      tooltip: 'إغلاق القناة',
                      icon: const Icon(
                        Icons.close_rounded,
                        color: CommunicationChannelTokens.textSecondary,
                      ),
                    )
                  else
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: CommunicationChannelTokens.textSecondary,
                      size: 26,
                    ),
                ],
              ),
              if (expanded) ...[
                const SizedBox(height: 14),
                ...teacher.messages.map(
                  (m) => _TeacherMessageBubble(
                    teacher: teacher,
                    item: m,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _TeacherAvatar extends StatelessWidget {
  final TeacherChannelItem teacher;
  final double radius;

  const _TeacherAvatar({required this.teacher, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: teacher.avatarColor,
      child: Text(
        teacher.initials,
        style: TextStyle(
          color: Colors.white,
          fontSize: radius * 0.9,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _TeacherMessageBubble extends StatelessWidget {
  final TeacherChannelItem teacher;
  final TeacherMessageItem item;

  const _TeacherMessageBubble({
    required this.teacher,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _TeacherAvatar(teacher: teacher, radius: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: CommunicationChannelTokens.bubbleBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: CommunicationChannelTokens.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    item.text,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: CommunicationChannelTokens.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: CommunicationChannelTokens.accent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.link_rounded,
                            size: 18,
                            color: CommunicationChannelTokens.accentAlt,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                item.attachmentTitle,
                                textAlign: TextAlign.right,
                            style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                item.attachmentSubtitle,
                                textAlign: TextAlign.right,
                            style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
