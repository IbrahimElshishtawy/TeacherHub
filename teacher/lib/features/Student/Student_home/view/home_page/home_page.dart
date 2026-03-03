import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/Student/Student_home/controller/Student_home_controller.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/AppBar_widget/home_app_bar.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/Home_Body_Content.dart';
import 'package:teacher/features/Student/Student_home/widgets_home/drawer/animated_Student_drawer_scaffold.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<StudentHomeController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: AnimatedStudentDrawerScaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: GetBuilder<StudentHomeController>(
              id: 'drawer_student',
              builder: (_) {
                final t = c.t.clamp(0.0, 1.0);
                return studentHomeAppBarWidget(
                  onMenuTap: c.toggleDrawer,
                  hideT: t,
                );
              },
            ),
          ),
          body: StudentHomeBodyContent(),
        ),
      ),
    );
  }
}
