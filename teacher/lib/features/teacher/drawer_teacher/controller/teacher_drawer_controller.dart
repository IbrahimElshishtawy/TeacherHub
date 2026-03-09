// ignore_for_file: camel_case_types, file_names

import 'package:get/get.dart';
import 'package:teacher/features/teacher/drawer_teacher/state/teacher_drawer_state.dart';
import 'package:teacher/features/teacher/home_teacher/controller/teacher_home_controller.dart';

class teacherDrawerController extends GetxController {
  final state = teacherDrawerState().obs;

  void goTo(String route) {
    final home = Get.find<teacherHomeController>();
    home.closeDrawer();
    if (state.value.selectedRoute == route) return;
    state.update((s) {
      s!.selectedRoute = route;
    });
    closeExpandableTile();
    Get.offNamed(route);
  }

  // دالة لإغلاق الدرو من الهوم
  void closeDrawerFromHome() {
    if (Get.isRegistered<teacherHomeController>()) {
      Get.find<teacherHomeController>().closeDrawer();
    }
  }

  void closeExpandableTile() {
    state.update((s) {
      s!.expandedItems.clear();
    });
  }

  void toggleExpansion(String route) {
    if (state.value.expandedItems.containsKey(route)) {
      state.update((s) {
        s!.expandedItems[route] = !s.expandedItems[route]!;
      });
    } else {
      state.update((s) {
        s!.expandedItems[route] = true;
      });
    }

    for (var key in state.value.expandedItems.keys) {
      if (key != route) {
        state.update((s) {
          s!.expandedItems[key] = false;
        });
      }
    }
  }
}
