import 'package:get/get.dart';
import '../controller/teacher_account_controller.dart';

class TeachersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherAccountController>(() => TeacherAccountController());
  }
}
