// ignore_for_file: unnecessary_underscores

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/Student/profile_student/controller/profile_student_controller.dart';
import 'package:student/Student/profile_student/state/profile_student_state.dart';

class ProfileStudentHeader extends StatelessWidget {
  const ProfileStudentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileStudentController>();

    return Obx(() {
      final data = controller.state.value;

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 52,
          left: 18,
          right: 18,
          bottom: 22,
        ),
        decoration: const BoxDecoration(
          color: ProfileStudentTheme.primary,
          boxShadow: [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Get.offNamed('/home_student'),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    // Navigate to settings screen
                    Get.toNamed('/settings_student');
                  },
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(data.avatarUrl),
                onBackgroundImageError: (_, __) {
                  // Handle image load error, maybe set a default avatar
                },
                backgroundColor: Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              data.studentName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.studentCode,
                  style: const TextStyle(
                    color: Color(0xFFD9DBFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.copy_rounded,
                  color: Color(0xFFD9DBFF),
                  size: 16,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
