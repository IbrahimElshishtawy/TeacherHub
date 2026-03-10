import 'package:get/get.dart';

import '../state/subject_state.dart';

class SubjectController extends GetxController {
  final state = SubjectOverviewState.initial().obs;

  void backHome() {
    Get.offNamed('/home_student');
  }

  void openSubject(SubjectItem subject) {
    Get.toNamed('/courses/details', arguments: subject);
  }

  void openLesson(SubjectLessonItem lesson) {
    Get.toNamed('/courses/lesson', arguments: lesson);
  }

  void openTests() {
    Get.toNamed('/courses/tests');
  }
}
