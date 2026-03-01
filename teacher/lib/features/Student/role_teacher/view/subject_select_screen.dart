import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/subject_teacher_controller.dart';
import 'teacher_select_screen.dart';

class SubjectSelectScreen extends GetView<SubjectTeacherController> {
  const SubjectSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          "ابدأ باختيار المادة",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          children: [
            const Text(
              "اختر المادة لعرض المدرسين المتاحين لها",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: Obx(() {
                return GridView.builder(
                  itemCount: controller.subjects.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.45,
                  ),
                  itemBuilder: (_, i) {
                    final s = controller.subjects[i];
                    final t = controller.selectedTeacher(s.id);
                    final isSelected = t != null;

                    return InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        Get.to(
                          () => TeacherSelectScreen(subject: s),
                          transition: Transition.cupertino,
                        );
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF2F80ED)
                              : Colors.white,
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
                            // أيقونة
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.white.withOpacity(.15)
                                    : const Color(0xFFF1F3F9),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.school),
                              // لو عندك Assets: Image.asset(s.iconAsset)
                            ),
                            const SizedBox(width: 10),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    s.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                    ),
                                  ),
                                  if (isSelected) ...[
                                    const SizedBox(height: 6),
                                    Text(
                                      t.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(.9),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),

                            if (isSelected) ...[
                              const SizedBox(width: 8),
                              CircleAvatar(
                                radius: 18,
                                backgroundImage: NetworkImage(t.avatarUrl),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),

            const SizedBox(height: 12),
            Obx(() {
              return SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2F80ED),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: controller.hasAnySelection
                      ? () {
                          // هنا توديه الصفحة الرئيسية / دخول التطبيق
                          // Get.offAllNamed(Routes.home);
                        }
                      : null,
                  child: Text(
                    controller.hasAnySelection
                        ? "الدخول للتطبيق"
                        : "اختر مادة ومدرس أولاً",
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
