import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:teacher/features/auth/state/auth_state.dart';

class AuthController extends GetxController {
  var authState = AuthState();

  void login(String email, String password) {
    authState.isAuthenticated.value = true;
    authState.userEmail.value = email;
  }

  void logout() {
    authState.isAuthenticated.value = false;
    authState.userEmail.value = '';
  }
}
