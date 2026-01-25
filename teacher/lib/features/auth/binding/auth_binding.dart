import 'package:get/get.dart';
import 'package:teacher/features/auth/state/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
