import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/exams_rr_controller.dart';
import '../widgets/exams_rr_header.dart';
import '../widgets/sections_list.dart';

class ExamsRRScreen extends GetView<ExamsRRController> {
  const ExamsRRScreen({super.key});

  static const Color bg = Color(0xFFF6F7FB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: const [
              ExamsRRHeader(),
              SizedBox(height: 14),
              SectionsList(),
              SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
