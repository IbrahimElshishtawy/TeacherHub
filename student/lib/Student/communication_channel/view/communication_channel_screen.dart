import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/communication_channel_controller.dart';
import '../widgets/communication_channel_header.dart';
import '../widgets/communication_channel_tokens.dart';
import '../widgets/teacher_channel_card.dart';

class CommunicationChannelScreen
    extends GetView<CommunicationChannelController> {
  const CommunicationChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CommunicationChannelTokens.pageBg,
        body: SafeArea(
          child: GetBuilder<CommunicationChannelController>(
            builder: (c) {
              final state = c.state.value;
              final selectedId = state.selectedTeacherId;
              final teachers = c.visibleTeachers;
              final selectedTeacher = c.selectedTeacher;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Column(
                  children: [
                    CommunicationChannelHeader(
                      title: state.title,
                      subtitle: state.subtitle,
                      onBack: c.goBackHome,
                    ),
                    const SizedBox(height: 16),
                    if (selectedTeacher != null)
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: CommunicationChannelTokens.surface,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: CommunicationChannelTokens.border,
                          ),
                        ),
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            const Icon(
                              Icons.forum_rounded,
                              color: CommunicationChannelTokens.accentAlt,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'القناة المفتوحة الآن',
                                    style: TextStyle(
                                      color: CommunicationChannelTokens.textSecondary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${selectedTeacher.teacherName} - ${selectedTeacher.subjectName}',
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      color: CommunicationChannelTokens.textPrimary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextButton.icon(
                              onPressed: c.closeSelectedTeacher,
                              icon: const Icon(Icons.grid_view_rounded, size: 18),
                              label: const Text('عرض الكل'),
                            ),
                          ],
                        ),
                      ),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 240),
                        child: ListView.builder(
                          key: ValueKey(selectedId ?? 'all_teachers'),
                          physics: const BouncingScrollPhysics(),
                          itemCount: teachers.length,
                          itemBuilder: (_, index) {
                            final teacher = teachers[index];
                            return TeacherChannelCard(
                              teacher: teacher,
                              expanded: selectedId == teacher.id,
                              onTap: () => c.selectTeacher(teacher.id),
                              onClose: c.closeSelectedTeacher,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.footerText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: CommunicationChannelTokens.textSecondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
