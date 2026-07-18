import 'package:get/get.dart';
import 'package:student/auth/controller/login_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
