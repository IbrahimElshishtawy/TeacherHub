import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/widgets/massage_create_teacher.dart';

class BottomNewTeacher extends StatefulWidget {
  const BottomNewTeacher({super.key, required Null Function() onPress});

  @override
  State<BottomNewTeacher> createState() => _BottomNewTeacherState();
}

class _BottomNewTeacherState extends State<BottomNewTeacher> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () => showCreateTeacherDialog(context),

        icon: const Icon(Icons.add),
        label: const Text(
          'إنشاء حساب مدرس جديد',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2F6FED),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
