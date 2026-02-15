import 'package:get/get.dart';
import 'package:teacher/features/admin/teachers/controller/teacher_account_controller.dart';
import 'package:teacher/features/admin/teachers/controller/teacher_form_controller.dart';

class TeachersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeachersController(), permanent: true);
    Get.lazyPut(() => TeacherFormController());
  }
}
