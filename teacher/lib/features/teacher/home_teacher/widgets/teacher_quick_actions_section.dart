import 'package:flutter/material.dart';
import 'teacher_card_shell.dart';
import 'teacher_quick_action_button.dart';

class TeacherQuickActionsSection extends StatelessWidget {
  const TeacherQuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TeacherCardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "إجراءات سريعة",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 14),
          GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              TeacherQuickActionButton(
                title: "رفع فيديو",
                icon: Icons.video_library_outlined,
                color: const Color(0xFF2F6BFF),
                onTap: () {
                  // TODO: Navigate to upload video
                },
              ),
              TeacherQuickActionButton(
                title: "رفع امتحان",
                icon: Icons.assignment_outlined,
                color: const Color(0xFF19B66A),
                onTap: () {
                  // TODO: Navigate to upload exam
                },
              ),
              TeacherQuickActionButton(
                title: "إضافة خبر",
                icon: Icons.newspaper_outlined,
                color: const Color(0xFFFF9800),
                onTap: () {
                  // TODO: Navigate to add news
                },
              ),
              TeacherQuickActionButton(
                title: "إنشاء اجتماع",
                icon: Icons.video_call_outlined,
                color: const Color(0xFF9C27B0),
                onTap: () {
                  // TODO: Navigate to create meeting
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
