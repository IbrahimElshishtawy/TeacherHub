// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:teacher/features/teacher/home_teacher/controller/teacher_home_controller.dart';
import 'package:teacher/features/teacher/home_teacher/widgets_home/AppBar_widget/home_app_bar.dart';
import 'package:teacher/features/teacher/home_teacher/widgets_home/Home_Body_Content.dart';
import 'package:teacher/features/teacher/home_teacher/widgets_home/drawer/animated_Student_drawer_scaffold.dart';

class teacherHomePage extends StatelessWidget {
  const teacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<teacherHomeController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: AnimatedteacherDrawerScaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(110),
            child: GetBuilder<teacherHomeController>(
              id: 'drawer_teacher',
              builder: (_) {
                final t = c.t.clamp(0.0, 1.0);
                return teacherHomeAppBarWidget(
                  onMenuTap: c.toggleDrawer,
                  hideT: t,
                );
              },
            ),
          ),
          body: teacherHomeBodyContent(),
        ),
      ),
    );
  }
}
