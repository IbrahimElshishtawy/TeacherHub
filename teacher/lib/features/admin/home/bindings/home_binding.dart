import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:teacher/features/admin/drawer/controller/admin_drawer_controller.dart';
import 'package:teacher/features/admin/drawer/state/admin_drawer_state.dart';
import 'package:teacher/features/admin/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AdminDrawerController>(() => AdminDrawerController());
    Get.lazyPut<AdminDrawerState>(() => AdminDrawerState());
  }
}
