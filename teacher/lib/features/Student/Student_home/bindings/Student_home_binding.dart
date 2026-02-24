// ignore_for_file: file_names

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:teacher/features/Student/Student_drawer/controller/Student_drawer_controller.dart';
import 'package:teacher/features/Student/Student_home/controller/Student_home_controller.dart';
import 'package:teacher/features/admin/admin_drawer/state/admin_drawer_state.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentHomeController>(() => StudentHomeController());
    Get.lazyPut<StudentDrawerController>(() => StudentDrawerController());
    Get.lazyPut<AdminDrawerState>(() => AdminDrawerState());
  }
}
