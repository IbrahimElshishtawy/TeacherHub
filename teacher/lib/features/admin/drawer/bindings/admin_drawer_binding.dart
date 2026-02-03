import 'package:get/get.dart';
import '../controller/admin_drawer_controller.dart';

class AdminDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDrawerController>(() => AdminDrawerController());
  }
}
