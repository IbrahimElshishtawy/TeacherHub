import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/auth/controller/login_controller.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(
      LoginController(),
    ); // الحصول على الـ Controller من GetX

    return Scaffold(
      appBar: AppBar(title: Text("تسجيل دخول الأدمن")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // صورة شعار الأدمن
            Icon(Icons.lock_outline, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              "إدارة النظام والمستخدمين",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // حقل البريد الإلكتروني
            TextField(
              decoration: InputDecoration(
                labelText: 'اسم المستخدم',
                prefixIcon: Icon(Icons.email),
              ),
              onChanged: (value) {
                loginController.userEmail.value = value;
              },
            ),
            SizedBox(height: 20),
            // حقل كلمة المرور
            Obx(
              () => TextField(
                obscureText: !loginController
                    .showPassword
                    .value, // إخفاء/إظهار كلمة المرور
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      loginController.showPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      loginController.togglePasswordVisibility();
                    },
                  ),
                ),
                onChanged: (value) {
                  loginController.userPassword.value = value;
                },
              ),
            ),
            SizedBox(height: 20),

            // زر تسجيل الدخول
            Obx(() {
              return ElevatedButton(
                onPressed: loginController.isLoading.value
                    ? null
                    : () {
                        loginController.loginAsAdmin(
                          loginController.userEmail.value,
                          loginController.userPassword.value,
                        );
                      },
                child: loginController.isLoading.value
                    ? CircularProgressIndicator()
                    : Text("تسجيل الدخول"),
              );
            }),

            // رابط نسيان كلمة المرور
            TextButton(
              onPressed: () {
                // فتح شاشة نسيان كلمة المرور
                print("Forgot Password clicked");
              },
              child: Text("نسيت كلمة المرور؟"),
            ),

            // تذكرني
            Row(
              children: [
                Obx(() {
                  return Checkbox(
                    value: loginController.rememberMe.value,
                    onChanged: (value) {
                      loginController.toggleRememberMe(value);
                    },
                  );
                }),
                Text("تذكرني"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
