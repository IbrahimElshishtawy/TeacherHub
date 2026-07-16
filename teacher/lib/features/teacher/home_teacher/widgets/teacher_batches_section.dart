import 'package:flutter/material.dart';
import 'teacher_card_shell.dart';
import 'teacher_batch_card.dart';

class TeacherBatchesSection extends StatelessWidget {
  const TeacherBatchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TeacherCardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "دفعاتي الحالية",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to all batches
                },
                child: const Text("عرض الكل"),
              )
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                TeacherBatchCard(
                  title: "مجموعة الأحد والثلاثاء",
                  stage: "الصف الأول الثانوي",
                  studentsCount: 150,
                  nextSession: "غداً 10:00 ص",
                ),
                TeacherBatchCard(
                  title: "مجموعة الإثنين والأربعاء",
                  stage: "الصف الثاني الثانوي",
                  studentsCount: 120,
                  nextSession: "اليوم 05:00 م",
                ),
                TeacherBatchCard(
                  title: "مجموعة المكثف",
                  stage: "الصف الثالث الثانوي",
                  studentsCount: 300,
                  nextSession: "الخميس 12:00 م",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
