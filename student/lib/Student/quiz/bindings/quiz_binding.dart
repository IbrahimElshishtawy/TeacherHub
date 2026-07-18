import 'package:get/get.dart';
import 'package:student/Student/quiz/controller/quiz_guard_controller.dart';

class QuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizGuardController>(() => QuizGuardController());
  }
}
