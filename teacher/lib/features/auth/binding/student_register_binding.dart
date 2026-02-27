import 'package:get/get.dart';
import '../controller/student_register_controller.dart';

class StudentRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentRegisterController>(() => StudentRegisterController());
  }
}
