import 'package:get/get.dart';

import '../state/my_courses_state.dart';

class MyCoursesController extends GetxController {
  final state = MyCoursesState.initial().obs;

  void openCourse(MyCourseItem course) {
    Get.toNamed('/my_courses/details', arguments: course);
  }

  void backToHome() {
    Get.offNamed('/home_student');
  }
}
