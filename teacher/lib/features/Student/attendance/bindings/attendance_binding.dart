import 'package:get/get.dart';
import '../controller/attendance_controller.dart';
import '../state/attendance_state.dart';

class AttendanceBindingtStudent extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceController>(() => AttendanceController());
    Get.lazyPut<AttendanceState>(() => AttendanceState());
  }
}
