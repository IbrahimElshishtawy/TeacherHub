import 'package:flutter/material.dart';
import 'teacher_card_shell.dart';
import 'teacher_overview_card.dart';

class TeacherOverviewSection extends StatelessWidget {
  const TeacherOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TeacherCardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "نظرة عامة سريعة",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 4),
          const Text(
            "إحصائيات سريعة عن حسابك",
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 14),
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              TeacherOverviewCard(
                title: "الطلاب",
                subtitle: "إجمالي الطلاب",
                value: "1,200",
                icon: Icons.groups_2_outlined,
                iconColor: Color(0xFF2F6BFF),
                valueColor: Color(0xFF2F6BFF),
              ),
              TeacherOverviewCard(
                title: "الدفعات النشطة",
                subtitle: "التي تقوم بتدريسها",
                value: "8",
                icon: Icons.class_outlined,
                iconColor: Color(0xFF19B66A),
                valueColor: Color(0xFF19B66A),
              ),
              TeacherOverviewCard(
                title: "الرسائل الجديدة",
                subtitle: "من الطلاب أو أولياء الأمور",
                value: "15",
                icon: Icons.chat_bubble_outline_rounded,
                iconColor: Color(0xFFFF9800),
                valueColor: Color(0xFFFF9800),
              ),
              TeacherOverviewCard(
                title: "الاجتماعات القادمة",
                subtitle: "في الـ 7 أيام القادمة",
                value: "3",
                icon: Icons.video_call_outlined,
                iconColor: Color(0xFF9C27B0),
                valueColor: Color(0xFF9C27B0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
