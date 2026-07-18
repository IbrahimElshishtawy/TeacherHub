import 'package:get/get.dart';

import '../state/notification_student_state.dart';

class NotificationStudentController extends GetxController {
  final state = NotificationStudentState.initial().obs;

  void backHome() {
    Get.offNamed('/home_student');
  }
}
