import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Login Fields
  RxBool isLoading = false.obs;
  RxBool isAuthenticated = false.obs;
  RxString userEmail = ''.obs;
  RxString userPassword = ''.obs;
  RxBool showPassword = false.obs;
  RxBool rememberMe = false.obs;

  // Page Control
  PageController pageController = PageController();
  RxInt currentStep = 0.obs;

  // Login Method
  void login(String email, String password) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isAuthenticated.value = false;

    // Admin
    if (email == "admin@example.com") {
      if (password == "admin123") {
        isAuthenticated.value = true;
        userEmail.value = email;
        Get.offAllNamed("/home_admin");
      } else {
        Get.toNamed('/error_401');
      }
    }
    // Student
    else if (email == "student@example.com") {
      if (password == "student123") {
        isAuthenticated.value = true;
        userEmail.value = email;
        Get.offAllNamed("/home_student");
      } else {
        Get.toNamed('/error_401');
      }
    }
    // Email مش موجود أصلاً
    else {
      Get.toNamed('/error_403');
    }

    isLoading.value = false;
  }

  // Toggle Password Visibility
  void togglePasswordVisibility() {
    showPassword.value = !showPassword.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }
}
