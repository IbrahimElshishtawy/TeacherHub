import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/subject_teacher_controller.dart';
import '../state/subject_teacher_state.dart';

class TeacherSelectScreen extends GetView<SubjectTeacherController> {
  final SubjectModel subject;
  const TeacherSelectScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    final teachers = controller.teachersForSubject(subject.id);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          "مدرسو ${subject.name}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          children: [
            Text(
              "اختر المدرس المناسب لك لمتابعة مادة ${subject.name}",
              style: const TextStyle(color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView.separated(
                itemCount: teachers.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, i) {
                  final t = teachers[i];

                  return InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: () {
                      controller.setTeacherForSubject(subject.id, t);
                      Get.back(); // يرجع لصفحة المواد
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                          // Status
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: t.available
                                          ? const Color(0xFF27AE60)
                                          : const Color(0xFFEB5757),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    t.available ? "متاح" : "غير متاح",
                                    style: TextStyle(
                                      color: t.available
                                          ? const Color(0xFF27AE60)
                                          : const Color(0xFFEB5757),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "أ / ${t.name}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "${t.gradeText} - ${t.stageText}",
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "عدد الطلاب مع المدرس : ${t.studentsCount} طالب",
                                  style: const TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 10),
                          CircleAvatar(
                            radius: 26,
                            backgroundImage: NetworkImage(t.avatarUrl),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F80ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Get.back(),
                child: const Text(
                  "استكمل باقي المواد",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
