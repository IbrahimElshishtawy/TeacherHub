import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/user_management/controller/user_management_controller.dart';
import 'package:teacher/features/admin/user_management/state/user_management_state.dart';
import 'package:teacher/features/admin/user_management/widgets/students_table_section.dart';

import 'card_shell.dart';

class StudentsTableSection extends GetView<UserManagementController> {
  final List<StudentRowModel> rows;
  const StudentsTableSection({super.key, required this.rows});

  static const Color primaryBlue = Color(0xFF2F6BFF);

  @override
  Widget build(BuildContext context) {
    return CardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "إدارة الطلاب",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 4),
          const Text(
            "عرض جميع الطلاب المسجلين والتحكم في حساباتهم",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: primaryBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  onChanged: controller.setStudentsQuery,
                  decoration: InputDecoration(
                    hintText: "ابحث بالاسم / الإيميل / الهاتف / الرقم التعريفي",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: const Color(0xFFF6F7FB),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          StudentsTable(rows: rows),

          const SizedBox(height: 12),

          Row(
            children: [
              ElevatedButton.icon(
                onPressed: controller.exportStudents,
                icon: const Icon(Icons.file_upload_outlined),
                label: const Text("Export"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Get.snackbar(
                  "عرض كل الطلاب",
                  "لو هتعمل صفحة منفصلة هنربطها هنا",
                ),
                child: const Text(
                  "عرض كل الطلاب",
                  style: TextStyle(
                    color: primaryBlue,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
