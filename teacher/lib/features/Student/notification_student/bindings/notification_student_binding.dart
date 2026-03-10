import 'package:get/get.dart';

import '../controller/notification_student_controller.dart';

class NotificationStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationStudentController>(
      () => NotificationStudentController(),
    );
  }
}
