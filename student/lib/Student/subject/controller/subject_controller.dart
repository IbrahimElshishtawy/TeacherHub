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

  void openCourseViewer(SubjectCourseItem course) {
    final lessons = state.value.lessons;
    SubjectLessonItem? matchedLesson;
    for (final lesson in lessons) {
      if (lesson.imageStyle == course.imageStyle) {
        matchedLesson = lesson;
        break;
      }
    }
    Get.toNamed('/courses/lesson', arguments: matchedLesson ?? lessons.first);
  }

  void openTests() {
    Get.toNamed('/courses/tests');
  }
}
