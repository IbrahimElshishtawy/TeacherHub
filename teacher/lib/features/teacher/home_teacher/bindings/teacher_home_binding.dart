import 'package:get/get.dart';
import 'package:teacher/features/teacher/home_teacher/controller/teacher_home_controller.dart';
import 'package:teacher/features/teacher/drawer_teacher/controller/teacher_drawer_controller.dart';
import 'package:teacher/features/teacher/drawer_teacher/state/teacher_drawer_state.dart';

class TeacherHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<teacherHomeController>(() => teacherHomeController());
    Get.lazyPut<teacherDrawerState>(() => teacherDrawerState());
    Get.lazyPut<teacherDrawerController>(() => teacherDrawerController());
  }
}
