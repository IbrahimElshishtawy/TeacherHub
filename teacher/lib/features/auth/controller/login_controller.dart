import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isAuthenticated = false.obs;
  RxString userEmail = ''.obs;
  RxString userPassword = ''.obs;
  RxBool showPassword = false.obs;
  RxBool rememberMe = false.obs;

  void loginAsAdmin(String email, String password) async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));

    if (email == "admin@example.com" && password == "admin123") {
      isAuthenticated.value = true;
      userEmail.value = email;
      Get.offAllNamed('/admin_dashboard');
    } else if (email == "admin@example.com" && password != "admin123") {
      isAuthenticated.value = false;
      Get.toNamed('/error_401');
    } else if (password != "admin123") {
      isAuthenticated.value = false;
      Get.toNamed('/error_403');
    } else {
      isAuthenticated.value = false;
      Get.snackbar(
        "Error",
        "Invalid credentials",
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    isLoading.value = false;
  }

  void togglePasswordVisibility() {
    showPassword.value = !showPassword.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }
}
