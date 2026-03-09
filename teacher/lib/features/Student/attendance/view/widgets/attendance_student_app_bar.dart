import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceStudentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AttendanceStudentAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color(0xFF8D221A),
        ),
        onPressed: () => Get.offAllNamed('/home_student'),
      ),
    );
  }
}
