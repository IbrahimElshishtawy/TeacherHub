// ignore_for_file: file_names

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:teacher/features/Student/Student_drawer/controller/Student_drawer_controller.dart';
import 'package:teacher/features/Student/Student_drawer/state/Student_drawer_state.dart';
import 'package:teacher/features/Student/Student_home/controller/Student_home_controller.dart';

class StudentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StudentHomeController>(StudentHomeController(), permanent: true);
    Get.put<StudentDrawerController>(StudentDrawerController(), permanent: true);
    Get.put<StudentDrawerState>(StudentDrawerState(), permanent: true);
  }
}
