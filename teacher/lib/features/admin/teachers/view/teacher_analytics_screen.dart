// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherAnalyticsScreen extends StatelessWidget {
  const TeacherAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments; // teacher.id
    return Scaffold(
      appBar: AppBar(title: const Text('تحليل البيانات')),
      body: Center(child: Text('Teacher ID: $id')),
    );
  }
}
