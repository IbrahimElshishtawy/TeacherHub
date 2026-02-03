// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:teacher/features/auth/controller/login_controller.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Obx(
        () => SizedBox(
          width: double.infinity,
          height: 40,
          child: ElevatedButton(
            onPressed: loginController.isLoading.value
                ? null
                : () {
                    loginController.loginAsAdmin(
                      loginController.userEmail.value,
                      loginController.userPassword.value,
                    );
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              elevation: 6,
              shadowColor: Colors.blue.withOpacity(0.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: loginController.isLoading.value
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    "تسجيل الدخول",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
          ),
        ),
      ),
    );
  }
}
