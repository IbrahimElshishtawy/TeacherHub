import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/auth/controller/login_controller.dart';
import 'package:teacher/features/auth/view/login/admin_login/widget/AppBar_Tap.dart';
import 'package:teacher/features/auth/view/login/admin_login/widget/Text_body_login.dart';
import 'package:teacher/features/auth/view/login/admin_login/widget/header_login_screan.dart';
import 'package:teacher/features/auth/view/login/admin_login/widget/input_login.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      appBar: AppbarTap(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// ===== HEADER =====
            HeaderLoginScrean(),

            /// ===== BODY =====
            TextBodyLogin(),

            // ===== login input ====
            InputLogin(),

            // تذكرني
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text("نسيت كلمة المرور؟"),
                ),
                Obx(
                  () => Checkbox(
                    value: loginController.rememberMe.value,
                    onChanged: loginController.toggleRememberMe,
                  ),
                ),
                const Text("تذكرني"),
              ],
            ),
            const SizedBox(height: 25), // المسافة بين الحقول
            // زر تسجيل الدخول
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: loginController.isLoading.value
                      ? null
                      : () {
                          loginController.loginAsAdmin(
                            loginController.userEmail.value,
                            loginController.userPassword.value,
                          );
                        },
                  child: loginController.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("تسجيل الدخول"),
                ),
              ),
            ),
            const SizedBox(height: 10), // المسافة بين الأزرار
            // نسيان كلمة المرور
          ],
        ),
      ),
    );
  }
}
