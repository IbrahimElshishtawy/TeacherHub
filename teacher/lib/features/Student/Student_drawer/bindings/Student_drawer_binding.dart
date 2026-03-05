// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:teacher/features/Student/Student_drawer/controller/Student_drawer_controller.dart';
import 'package:teacher/features/Student/Student_drawer/state/Student_drawer_state.dart';

class StudentDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentDrawerState>(() => StudentDrawerState());
    Get.lazyPut<StudentDrawerController>(() => StudentDrawerController());
  }
}
