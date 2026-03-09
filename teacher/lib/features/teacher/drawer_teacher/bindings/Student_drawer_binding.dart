// ignore_for_file: camel_case_types, file_names

import 'package:get/get.dart';
import 'package:teacher/features/teacher/drawer_teacher/controller/teacher_drawer_controller.dart';
import 'package:teacher/features/teacher/drawer_teacher/state/teacher_drawer_state.dart';

class teacherDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<teacherDrawerState>(() => teacherDrawerState());
    Get.lazyPut<teacherDrawerController>(() => teacherDrawerController());
  }
}
