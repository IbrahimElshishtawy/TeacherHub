import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/admin/user_management/widgets/students_header.dart';
import 'package:teacher/features/admin/user_management/widgets/students_overview_section.dart';
import 'package:teacher/features/admin/user_management/widgets/students_table.dart';

import '../controller/user_management_controller.dart';
import '../state/user_management_state.dart';

class StudentsScreen extends GetView<UserManagementController> {
  const StudentsScreen({super.key});

  static const Color bg = Color(0xFFF6F7FB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Obx(() {
            final st = controller.state.value;
            final rows = controller.filteredStudents;

            return ListView(
              children: [
                const StudentsHeader(),
                const SizedBox(height: 14),

                StudentsOverviewSection(
                  st: st,
                  onOverview: controller.openStudentsOverview,
                  onTable: controller.openStudentsTable,
                ),

                const SizedBox(height: 14),

                if (st.studentsMode == StudentsViewMode.table)
                  StudentsTableSection(rows: rows),

                const SizedBox(height: 18),
              ],
            );
          }),
        ),
      ),
    );
  }
}
