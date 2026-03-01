// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/subject_teacher_controller.dart';
import '../widgets/subject_select_header.dart';
import '../widgets/subject_grid.dart';
import '../widgets/subject_bottom_cta.dart';

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
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: const [
            SubjectSelectHeader(),
            SizedBox(height: 10),
            Expanded(child: SubjectGrid()),
            SubjectBottomCta(),
          ],
        ),
      ),
    );
  }
}
