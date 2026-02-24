import 'package:get/get.dart';
import 'package:teacher/features/admin/admin_drawer/state/admin_drawer_state.dart';
import '../controller/admin_drawer_controller.dart';

class AdminDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDrawerState>(() => AdminDrawerState());
    Get.lazyPut<AdminDrawerController>(() => AdminDrawerController());
  }
}
