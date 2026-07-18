// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:student/Student/Student_drawer/state/Student_drawer_state.dart';
import 'package:student/Student/Student_home/controller/Student_home_controller.dart';

class StudentDrawerController extends GetxController {
  final state = StudentDrawerState().obs;

  void goTo(String route) {
    final home = Get.find<StudentHomeController>();
    home.closeDrawer();

    // 2) لو نفس الصفحة المختارة متعملش حاجة
    if (state.value.selectedRoute == route) return;

    // 3) خزّن الـ selected route
    state.update((s) {
      s!.selectedRoute = route;
    });

    // 4) Collapse any expanded items (resetting them)
    closeExpandableTile();

    // 5) روح للصفحة (مهم: مش Get.back)
    Get.offNamed(route); // أو Get.toNamed(route) لو عايز stack
  }

  // دالة لإغلاق الدرو من الهوم
  void closeDrawerFromHome() {
    if (Get.isRegistered<StudentHomeController>()) {
      Get.find<StudentHomeController>().closeDrawer();
    }
  }

  // دالة لتحديث حالة التوسيع والتقليص
  void closeExpandableTile() {
    state.update((s) {
      s!.expandedItems.clear(); // إلغاء التوسيع لجميع العناصر عند التغيير
    });
  }

  // دالة لتوسيع أو تقليص عنصر عند الضغط عليه
  void toggleExpansion(String route) {
    if (state.value.expandedItems.containsKey(route)) {
      state.update((s) {
        s!.expandedItems[route] =
            !s.expandedItems[route]!; // Toggle the expanded state
      });
    } else {
      state.update((s) {
        s!.expandedItems[route] =
            true; // Expand the item if it's not expanded yet
      });
    }

    // Close all other items that are not the selected one
    for (var key in state.value.expandedItems.keys) {
      if (key != route) {
        state.update((s) {
          s!.expandedItems[key] = false;
        });
      }
    }
  }
}
