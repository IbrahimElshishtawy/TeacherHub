// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import '../widgets/teacher_overview_section.dart';
import '../widgets/teacher_quick_actions_section.dart';
import '../widgets/teacher_batches_section.dart';

class teacherHomeBodyContent extends StatelessWidget {
  const teacherHomeBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TeacherOverviewSection(),
          SizedBox(height: 16),
          TeacherQuickActionsSection(),
          SizedBox(height: 16),
          TeacherBatchesSection(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
