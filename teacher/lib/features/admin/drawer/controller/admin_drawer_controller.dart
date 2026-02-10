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

    // 4) روح للصفحة (مهم: مش Get.back)
    Get.offNamed(route); // أو Get.toNamed(route) لو عايز stack
  }

  // دالة لإغلاق الدرو من الهوم
  void closeDrawerFromHome() {
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().closeDrawer();
    }
  }
}
