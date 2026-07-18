import 'package:get/get.dart';
import 'package:student/Student/profile_student/controller/profile_student_controller.dart';

class ProfileStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileStudentController>(() => ProfileStudentController());
  }
}
