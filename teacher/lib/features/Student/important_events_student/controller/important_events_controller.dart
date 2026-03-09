import 'package:get/get.dart';

import '../state/important_events_state.dart';

class ImportantEventsController extends GetxController {
  final ImportantEventsState state = Get.find<ImportantEventsState>();

  void goToStudentHome() {
    Get.offNamed('/home_student');
  }
}
