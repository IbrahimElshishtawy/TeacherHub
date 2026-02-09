import 'package:get/get.dart';
import '../state/admin_drawer_state.dart';

class AdminDrawerController extends GetxController {
  final state = AdminDrawerState().obs;

  @override
  void onInit() {
    super.onInit();
    final current = Get.currentRoute;
    if (current.isNotEmpty) {
      state.update((s) => s?.selectedRoute = current);
    }
  }

  void goTo(String route) {
    state.update((s) => s?.selectedRoute = route);

    if (Get.isOverlaysOpen) Get.back();

    if (Get.currentRoute != route) {
      Get.offNamed(route);
    }
  }
}
