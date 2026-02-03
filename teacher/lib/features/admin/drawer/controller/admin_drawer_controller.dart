import 'package:get/get.dart';
import '../state/admin_drawer_state.dart';

class AdminDrawerController extends GetxController {
  final state = AdminDrawerState().obs;

  void syncSelectedWithRoute(String currentRoute) {
    final i = state.value.mainItems.indexWhere((e) => e.route == currentRoute);
    if (i >= 0) {
      state.update((s) {
        if (s == null) return;
        s.selectedIndex = i;
      });
    }
  }

  void openMain(int index) {
    state.update((s) {
      if (s == null) return;
      s.selectedIndex = index;
    });

    Get.offNamed(state.value.mainItems[index].route);
  }

  void openSecondary(int index) {
    Get.toNamed(state.value.secondaryItems[index].route);
  }

  void logout() {
    Get.offAllNamed("/login");
  }
}
