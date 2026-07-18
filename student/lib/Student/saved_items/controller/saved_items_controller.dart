import 'package:get/get.dart';

import '../state/saved_items_state.dart';

class SavedItemsController extends GetxController {
  final SavedItemsState state = Get.find<SavedItemsState>();

  void setTab(SavedItemsTab tab) {
    state.selectedTab = tab;
    update();
  }

  void setQuery(String value) {
    state.query = value;
    update();
  }

  void goBackToHome() {
    Get.offNamed('/home_student');
  }

  void goToMyCourses() {
    Get.toNamed('/my_courses');
  }
}
