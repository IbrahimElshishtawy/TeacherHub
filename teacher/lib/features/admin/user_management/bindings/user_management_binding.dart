import 'package:get/get.dart';
import 'package:teacher/features/admin/user_management/controller/user_management_controller.dart';

class StudentsManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentsManagementController>(
      () => StudentsManagementController(),
    );
  }
}
