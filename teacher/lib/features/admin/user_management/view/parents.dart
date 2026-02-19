import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/user_management_controller.dart';
import '../state/user_management_state.dart';

import 'package:teacher/features/admin/user_management/widgets/parents_header.dart';
import 'package:teacher/features/admin/user_management/widgets/parents_overview_section.dart';
import 'package:teacher/features/admin/user_management/widgets/parents_table_section.dart';

class ParentsScreen extends GetView<UserManagementController> {
  const ParentsScreen({super.key});

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
            final rows = controller.filteredParents;

            return ListView(
              children: [
                const ParentsHeader(),
                const SizedBox(height: 14),

                ParentsOverviewSection(
                  st: st,
                  onOverview: controller.openParentsOverview,
                  onTable: controller.openParentsTable,
                ),

                const SizedBox(height: 14),

                if (st.parentsMode == ParentsViewMode.table)
                  ParentsTableSection(rows: rows),

                const SizedBox(height: 18),
              ],
            );
          }),
        ),
      ),
    );
  }
}
