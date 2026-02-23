import 'package:get/get.dart';
import 'package:teacher/features/admin/home/controller/home_controller.dart';
import '../state/admin_drawer_state.dart';

class AdminDrawerController extends GetxController {
  final state = AdminDrawerState().obs;

  void goTo(String route) {
    final home = Get.find<HomeController>();
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
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().closeDrawer();
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
