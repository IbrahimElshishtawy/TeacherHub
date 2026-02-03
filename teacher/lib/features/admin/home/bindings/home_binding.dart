import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../../drawer/controller/admin_drawer_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AdminDrawerController>(() => AdminDrawerController());
  }
}
