import 'package:get/get.dart';
import '../controller/subject_teacher_controller.dart';

class SubjectTeacherBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SubjectTeacherController(), permanent: true);
  }
}
